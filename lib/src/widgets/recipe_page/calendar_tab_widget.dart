import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/hive_functions.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycook/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalendarTabWidget extends StatefulWidget {
  final RecipeModel recipe;
  const CalendarTabWidget({required this.recipe, Key? key}) : super(key: key);

  @override
  _CalendarTabWidgetState createState() => _CalendarTabWidgetState();
}

class _CalendarTabWidgetState extends State<CalendarTabWidget> {
  RecipesDatabase db = RecipesDatabase();

  Future<void> _showDialogDelete(
      BuildContext context, Box box, boxRecipe, DateTime dateTime) async {
    await showDialog(
        context: context,
        useSafeArea: true,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("¿Seguro que desea eliminar el evento?"),
            content: Text(dateTime.toString().dateString),
            actions: <Widget>[
              TextButton(
                  child: Text("NO"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: Text("SÍ"),
                  onPressed: () {
                    Navigator.pop(context);
                    removeRecipeDateTimeInCalendar(
                        box, boxRecipe, widget.recipe.id, dateTime);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(calendarBox).listenable(),
      builder: (BuildContext context, Box box, _) {
        var boxRecipe = box.get(widget.recipe.id);
        boxRecipe?[2].sort();

        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            if (boxRecipe != null && boxRecipe[2].length > 0)
              for (DateTime dateTime in boxRecipe[2])
                ListTile(
                  title: Text(
                    dateTime.toString().dateString,
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialogCalendar(context, dateTime, box, boxRecipe,
                              widget.recipe, true,
                              oldDateTime: dateTime);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDialogDelete(context, box, boxRecipe, dateTime);
                        },
                      ),
                    ],
                  ),
                )
            else
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text("No has planificado esta receta"),
                ),
              )
          ],
        );
      },
    );
  }
}
