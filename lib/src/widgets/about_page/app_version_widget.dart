// import 'package:bettycook/src/config.dart';
// import 'package:bettycook/src/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class AppVersionWidget extends StatelessWidget {
//   const AppVersionWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         ValueListenableBuilder(
//           valueListenable: hiveDB.settingsBoxListable(),
//           builder: (BuildContext context, Box settingsBox, Widget? child) {
//             return ListTile(
//               title: Center(
//                 child: Text(
//                   "version ${settingsBox.get(settingsBoxAppVersionKey)}",
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
