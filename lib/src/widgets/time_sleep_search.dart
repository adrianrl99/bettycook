import 'dart:async';

import 'package:flutter/material.dart';

class TimeSleepSearch {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  TimeSleepSearch({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
