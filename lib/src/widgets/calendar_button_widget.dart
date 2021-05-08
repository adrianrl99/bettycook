// import 'package:badges/badges.dart';
// import 'package:bettycook/src/adapters/adapters.dart';
// import 'package:bettycook/src/config.dart';
// import 'package:bettycook/src/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class CalendarButtonWidget extends StatelessWidget {
//   final RecipeHive recipe;
//   const CalendarButtonWidget({required this.recipe, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: hiveDB.recipesBoxListable(),
//       builder:
//           (BuildContext context, Box<RecipeHive> recipesBox, Widget? child) {
//         return IconButton(
//           icon: Badge(
//             badgeContent: Text(this.recipe.calendar.length.toString()),
//             showBadge: this.recipe.calendar.length > 0,
//             child: Icon(
//               Icons.calendar_today,
//               color:
//                   this.recipe.calendar.length > 0 ? Colors.green : Colors.white,
//             ),
//           ),
//           onPressed: () {
//             showPickerCalendar(context, this.recipe, recipesBox);
//           },
//         );
//       },
//     );
//   }
// }
