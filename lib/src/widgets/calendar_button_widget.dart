import 'package:badges/badges.dart';
import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalendarButtonWidget extends StatelessWidget {
  final RecipeHive recipe;
  const CalendarButtonWidget({required this.recipe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(calendarBoxKey).listenable(),
      builder: (BuildContext context, Box box, _) {
        var boxRecipe = box.get(this.recipe.key);
        return IconButton(
          icon: Badge(
            badgeContent: Text(
              boxRecipe != null ? boxRecipe[2].length.toString() : "",
            ),
            showBadge:
                box.containsKey(this.recipe.key) && boxRecipe[2].length > 0,
            child: Icon(
              Icons.calendar_today,
              color: box.containsKey(this.recipe.key) && boxRecipe[2].length > 0
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
