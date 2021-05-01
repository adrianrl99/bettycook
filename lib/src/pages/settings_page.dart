import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = "/settings";
  static const title = "Configuraciones";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Text('En desarrollo'),
        ),
      ),
    );
  }
}
