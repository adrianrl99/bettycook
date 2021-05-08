// import 'package:bettycook/src/adapters/adapters.dart';
// import 'package:bettycook/src/config.dart';
// import 'package:bettycook/src/widgets/recipe_page/add_note_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class NotesWidget extends StatelessWidget {
//   final RecipeHive recipe;
//   const NotesWidget({required this.recipe, Key? key}) : super(key: key);

//   void _addNotes(BuildContext context, {String? initialText, int? noteKey}) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AddNoteWidget(
//               recipe: this.recipe, initialText: initialText, noteKey: noteKey);
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("Notas de ${this.recipe.title}"),
//       content: ValueListenableBuilder(
//           valueListenable: hiveDB.recipesBoxListable(),
//           builder: (BuildContext context, Box<RecipeHive> box, Widget? child) {
//             if (this.recipe.notes.isNotEmpty)
//               return ListView(
//                 children: [
//                   for (String note in this.recipe.notes)
//                     ListTile(
//                       title: Text(note),
//                       onLongPress: () => _addNotes(context,
//                           initialText: note,
//                           noteKey: this.recipe.notes.indexOf(note)),
//                     ),
//                 ],
//               );
//             else
//               return ListTile(
//                 title: Text("No tienes ninguna nota todavia"),
//               );
//           }),
//       actions: <Widget>[
//         TextButton(
//             child: Text("SALIR"),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         TextButton(
//           child: Text("AÑADIR"),
//           onPressed: () => _addNotes(context),
//         ),
//       ],
//     );
//   }
// }
