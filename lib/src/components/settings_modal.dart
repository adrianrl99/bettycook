import 'package:flutter/material.dart';

class SettingsModal extends StatelessWidget {
  const SettingsModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Cambiar tema"),
          ),
        ],
      ),
    );
  }
}
