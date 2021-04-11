import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsModal extends StatelessWidget {
  const SettingsModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ValueListenableBuilder(
            valueListenable: Hive.box(darkModeBox).listenable(),
            builder: (context, box, widget) {
              var darkMode = box.get("darkMode", defaultValue: false);
              return ListTile(
                title: Text("Cambiar tema"),
                onTap: () {
                  box.put('darkMode', !darkMode);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
