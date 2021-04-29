import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNoteWidget extends StatefulWidget {
  final RecipeHive recipe;
  final String? initialText;
  final int? noteKey;
  AddNoteWidget(
      {required this.recipe, this.initialText, this.noteKey, Key? key})
      : super(key: key);

  @override
  _AddNoteWidgetState createState() => _AddNoteWidgetState();
}

class _AddNoteWidgetState extends State<AddNoteWidget> {
  String? _text;

  @override
  void initState() {
    super.initState();
    _text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text("Añadir nota nueva"),
        content: TextFormField(
          maxLines: 10,
          initialValue: _text,
          onChanged: (String text) {
            setState(() {
              _text = text;
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Escribe tu Nota',
              alignLabelWithHint: true),
        ),
        actions: [
          if (widget.initialText != null && widget.noteKey != null)
            TextButton(
                child: Text("BORRAR"),
                onPressed: () {
                  widget.recipe.notes.remove(widget.initialText);
                  hiveDB.recipesBox.put(widget.recipe.key, widget.recipe);
                  Navigator.pop(context);
                }),
          TextButton(
              child: Text("CANCELAR"),
              onPressed: () {
                Navigator.pop(context);
              }),
          TextButton(
              child: Text(widget.initialText != null && widget.noteKey != null
                  ? "SALVAR"
                  : "AÑADIR"),
              onPressed: () {
                if (_text != null &&
                    _text!.isNotEmpty &&
                    _text != widget.initialText &&
                    !widget.recipe.notes.contains(_text!)) {
                  if (widget.initialText == null && widget.noteKey == null) {
                    widget.recipe.notes.add(_text!);
                  } else {
                    widget.recipe.notes.remove(widget.initialText);
                    widget.recipe.notes.insert(widget.noteKey!, _text!);
                  }
                  hiveDB.recipesBox.put(widget.recipe.key, widget.recipe);

                  Navigator.pop(context);
                }
              }),
        ],
      ),
    );
  }
}
