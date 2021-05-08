import 'package:bettycook/src/config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TipsPage extends StatelessWidget {
  static const routeName = "/tips";
  static const String title = "Tips";

  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TipsPage.title),
      ),
      body: Container(
        // child: ValueListenableBuilder(
        //   valueListenable: hiveDB.tipsBoxListable(),
        //   builder: (BuildContext context, Box<TipHive> tipsBox, Widget? child) {
        //     return ListView(
        //       children: <ListTile>[
        //         for (TipHive tip in tipsBox.values)
        //           ListTile(
        //             title: Text(tip.tip),
        //           ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
