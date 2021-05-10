import 'package:bettycook/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(App());
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}
