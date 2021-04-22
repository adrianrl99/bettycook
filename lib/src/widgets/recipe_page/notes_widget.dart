import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/recipe_page/add_note_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesWidget extends StatelessWidget {
  final RecipeModel recipe;
  const NotesWidget({required this.recipe, Key? key}) : super(key: key);

  void _addNotes(BuildContext context, {String? initialText, int? noteKey}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddNoteWidget(initialText: initialText, noteKey: noteKey);
        });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Notas de ${this.recipe.title}"),
      content: ValueListenableBuilder(
          valueListenable: Hive.box(notesBox).listenable(),
          builder: (BuildContext context, Box box, _) {
            if (box.isNotEmpty)
              return ListView(
                children: [
                  for (int noteKey in box.keys)
                    ListTile(
                      title: Text(box.get(noteKey).toString()),
                      onLongPress: () => _addNotes(context,
                          initialText: box.get(noteKey), noteKey: noteKey),
                    ),
                ],
              );
            else
              return ListTile(
                title: Text("No tienes ninguna nota todavia"),
              );
          }),
      actions: <Widget>[
        TextButton(
            child: Text("SALIR"),
            onPressed: () {
              Navigator.pop(context);
            }),
        TextButton(
          child: Text("AÑADIR"),
          onPressed: () => _addNotes(context),
        ),
      ],
    );
  }
}
