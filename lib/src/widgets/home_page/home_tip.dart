import 'dart:math';

import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeTip extends StatelessWidget {
  const HomeTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Tip para ti",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: hiveDB.tipsBoxListable(),
              builder:
                  (BuildContext context, Box<TipHive> tipsBox, Widget? child) {
                Random random = Random();
                return ListTile(
                  title: Text(tipsBox.values
                      .toList()[random.nextInt(tipsBox.length)]
                      .tip),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
