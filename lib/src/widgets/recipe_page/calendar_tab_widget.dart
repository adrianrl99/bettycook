import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycook/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CalendarTabWidget extends StatelessWidget {
  final RecipeHive recipe;
  const CalendarTabWidget({required this.recipe, Key? key}) : super(key: key);

  Future<void> _showDialogDelete(BuildContext context,
      Box<RecipeHive> recipesBox, DateTime dateTime) async {
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
                    this.recipe.calendar.remove(dateTime);
                    recipesBox.put(this.recipe.key, this.recipe);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hiveDB.recipesBoxListable(),
      builder:
          (BuildContext context, Box<RecipeHive> recipesBox, Widget? child) {
        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            if (this.recipe.calendar.isNotEmpty)
              for (DateTime dateTime in this.recipe.calendar)
                ListTile(
                  title: Text(dateTime.toString().dateString),
                  trailing: Wrap(
                    children: <IconButton>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialogCalendar(
                              context, dateTime, this.recipe, recipesBox, true,
                              oldDateTime: dateTime);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDialogDelete(context, recipesBox, dateTime);
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
