// import 'package:bettycook/src/adapters/adapters.dart';
// import 'package:bettycook/src/config.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class FavoriteButtonWidget extends StatelessWidget {
//   final RecipeHive recipe;
//   const FavoriteButtonWidget({required this.recipe, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: hiveDB.recipesBoxListable(),
//       builder:
//           (BuildContext context, Box<RecipeHive> recipesBox, Widget? child) {
//         return IconButton(
//             icon: Icon(
//               this.recipe.favorite ? Icons.favorite : Icons.favorite_outline,
//               color: this.recipe.favorite ? Colors.red[800] : Colors.white,
//             ),
//             onPressed: () async {
//               this.recipe.favorite = !this.recipe.favorite;
//               await recipesBox.put(this.recipe.id, this.recipe);
//             });
//       },
//     );
//   }
// }
