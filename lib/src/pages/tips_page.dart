import 'package:bettycook/src/config.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  static const routeName = "/tips";
  static const String title = "Concejos";

  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TipsPage.title),
      ),
      body: ListView(
        children: <Widget>[
          for (TipHive tip in hiveDB.tipsBoxBase.values)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    title: Text(tip.tip),
                  ),
                ),
                if (hiveDB.tipsBoxBase.values.last.key != tip.key) Divider(),
              ],
            ),
        ],
      ),
    );
  }
}
