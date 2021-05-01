import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/hive_functions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class Event {
  final RecipeHive recipe;

  const Event({required this.recipe});
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
    BuildContext context, RecipeHive recipe, Box<RecipeHive> recipesBox,
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
      showDialogCalendar(context, dateTime, recipe, recipesBox, false,
          oldDateTime: oldDateTime);
    }
  }
}

void showDialogCalendar(BuildContext context, DateTime dateTime,
    RecipeHive recipe, Box<RecipeHive> recipesBox, bool isEdit,
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
              showPickerCalendar(context, recipe, recipesBox,
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
                    addRecipeInCalendar(recipe, recipesBox, dateTime,
                        oldDateTime: oldDateTime);
                })
          ],
        );
      });
}
