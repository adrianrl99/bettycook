import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/hive_functions.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class Event {
  final int id;
  final String title;

  const Event({required this.id, required this.title});
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kNow = DateTime.now();
final kFirstDay = DateTime(kNow.year, DateTime.january, kNow.day);
final kLastDay = DateTime(kNow.year, DateTime.december, kNow.day);

void launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'No se pudo abrir $url';

// Funcions for Edit Calendar

void showPickerCalendar(
    BuildContext context, Box box, boxRecipe, RecipeHive recipe,
    {DateTime? oldDateTime}) async {
  DateTime? date = await showDatePicker(
      context: context,
      initialDate: kNow,
      firstDate: kFirstDay,
      lastDate: kLastDay);
  if (date != null) {
    TimeOfDay? timeOfDay =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (timeOfDay != null) {
      DateTime dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        timeOfDay.hour,
        timeOfDay.minute,
      );
      showDialogCalendar(context, dateTime, box, boxRecipe, recipe, false,
          oldDateTime: oldDateTime);
    }
  }
}

void showDialogCalendar(BuildContext context, DateTime dateTime, Box box,
    boxRecipe, RecipeHive recipe, bool isEdit,
    {DateTime? oldDateTime}) async {
  await showDialog(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text("Toque la fecha para cambiarla"),
          content: ListTile(
            title: Text(
              dateTime.toString().dateString,
            ),
            onTap: () {
              Navigator.pop(context);
              showPickerCalendar(context, box, boxRecipe, recipe,
                  oldDateTime: oldDateTime);
            },
          ),
          actions: <Widget>[
            TextButton(
                child: Text("CANCELAR"),
                onPressed: () {
                  Navigator.pop(context);
                }),
            TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  if (!isEdit)
                    addRecipeInCalendar(
                        box, boxRecipe, recipe.key, recipe.title, dateTime,
                        oldDateTime: oldDateTime);
                })
          ],
        );
      });
}
