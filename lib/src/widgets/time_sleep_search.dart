import 'dart:async';

import 'package:flutter/material.dart';

class TimeSleepSearch {
  final int milliseconds;
  late VoidCallback action;
  late Timer _timer;

  TimeSleepSearch({required this.milliseconds});

  run(VoidCallback action) {
    _timer.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
