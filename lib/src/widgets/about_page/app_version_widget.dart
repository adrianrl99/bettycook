import 'package:bettycook/src/config.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';

class AppVersionWidget extends StatelessWidget {
  const AppVersionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          "version ${hiveDB.settingsBoxBase.get(settingsBoxAppVersionKey)}",
        ),
      ),
    );
  }
}
