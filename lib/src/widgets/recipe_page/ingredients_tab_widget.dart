// import 'package:bettycook/src/adapters/adapters.dart';
// import 'package:bettycook/src/widgets/recipe_page/ingredient_widget.dart';
// import 'package:flutter/material.dart';

// class IngredientsTabWidget extends StatelessWidget {
//   final List<IngredientHive> ingredients;
//   const IngredientsTabWidget({required this.ingredients, Key? key})
//       : super(key: key);

//   void _showDialog(BuildContext context, String comment) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Comentario"),
//             content: Text(comment),
//             actions: <Widget>[
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("SALIR"))
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         if (this.ingredients.isNotEmpty)
//           for (IngredientHive ingredient in this.ingredients)
//             Column(
//               children: <Widget>[
//                 if (ingredient.target.isNotEmpty)
//                   ListTile(
//                     title: Text(
//                       ingredient.target,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     children: <Widget>[
//                       for (IngredientsHive _ingredients
//                           in ingredient.ingredients)
//                         ListTile(
//                           trailing: _ingredients.comment.isNotEmpty
//                               ? IconButton(
//                                   icon: Icon(
//                                     Icons.help_outline,
//                                   ),
//                                   onPressed: () => _showDialog(
//                                       context, _ingredients.comment),
//                                 )
//                               : null,
//                           title: IngredientWidget(
//                             ingredients: _ingredients,
//                           ),
//                         )
//                     ],
//                   ),
//                 )
//               ],
//             )
//         else
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: Container(
//               alignment: Alignment.topCenter,
//               child: Text("Esta receta no tiene ingredientes"),
//             ),
//           ),
//       ],
//     );
//   }
// }
