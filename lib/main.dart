import 'package:bettycook/src/app.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/error_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

void main() async {
  await hiveDB.initMobile();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  bool isCheck = await hiveDB.checkMobileVersion(
    appName: packageInfo.appName,
    buildNumber: packageInfo.buildNumber,
    packageName: packageInfo.packageName,
    version: packageInfo.version,
  );

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  if (isCheck) {
    runApp(App());
  } else {
    runApp(ErrorApp());
  }
}
