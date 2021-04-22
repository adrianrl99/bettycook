import 'package:badges/badges.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalendarButtonWidget extends StatelessWidget {
  final RecipeModel recipe;
  const CalendarButtonWidget({required this.recipe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(calendarBox).listenable(),
      builder: (BuildContext context, Box box, _) {
        var boxRecipe = box.get(this.recipe.id);
        return IconButton(
          icon: Badge(
            badgeContent: Text(
              boxRecipe != null ? boxRecipe[2].length.toString() : "",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeColor: Theme.of(context).primaryColor,
            showBadge:
                box.containsKey(this.recipe.id) && boxRecipe[2].length > 0,
            child: Icon(
              Icons.calendar_today,
              color: box.containsKey(this.recipe.id) && boxRecipe[2].length > 0
                  ? Colors.green
                  : Colors.white,
            ),
          ),
          onPressed: () =>
              showPickerCalendar(context, box, boxRecipe, this.recipe),
        );
      },
    );
  }
}
