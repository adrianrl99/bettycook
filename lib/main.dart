import 'package:bettycook/src/app.dart';
import 'package:bettycook/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

void main() async {
  await hiveDB.initMobile();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  print(packageInfo.appName);
  print(packageInfo.buildNumber);
  print(packageInfo.packageName);
  print(packageInfo.version);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(App());
}
