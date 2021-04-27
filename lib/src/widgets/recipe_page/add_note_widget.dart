import 'package:bettycook/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNoteWidget extends StatefulWidget {
  final String? initialText;
  final int? noteKey;
  AddNoteWidget({this.initialText, this.noteKey, Key? key}) : super(key: key);

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
                  Box box = Hive.box(notesBoxKey);
                  box.delete(widget.noteKey);
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
                    _text != widget.initialText) {
                  Box box = Hive.box(notesBoxKey);
                  if (widget.initialText != null && widget.noteKey != null)
                    box.put(widget.noteKey, _text);
                  else
                    box.add(_text);

                  Navigator.pop(context);
                }
              }),
        ],
      ),
    );
  }
}
