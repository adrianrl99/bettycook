import 'dart:collection';

import 'package:bettycook/src/hive_functions.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(2020, 10, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    DateTime.now(): [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

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
    BuildContext context, Box box, boxRecipe, RecipeModel recipe) async {
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
      showDialogCalendar(context, dateTime, box, boxRecipe, recipe, false);
    }
  }
}

void showDialogCalendar(BuildContext context, DateTime dateTime, Box box,
    boxRecipe, RecipeModel recipe, bool isEdit) async {
  await showDialog(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text("Toque la fecha para cambiarla"),
          content: ListTile(
            title: Text(
              dateTime.toString(),
            ),
            onTap: () {
              Navigator.pop(context);
              showPickerCalendar(context, box, boxRecipe, recipe);
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
                        box, boxRecipe, recipe.id, recipe.title, dateTime);
                })
          ],
        );
      });
}
