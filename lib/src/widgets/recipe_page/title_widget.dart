import 'package:flutter/material.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class TitleWidget extends StatefulWidget {
  final ScrollController controller;
  final String title;
  TitleWidget({required this.controller, required this.title, Key? key})
      : super(key: key);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  bool showTitle = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.position.pixels > 170 && showTitle == true)
        setState(() {
          showTitle = false;
        });
      else if (widget.controller.position.pixels <= 170 && showTitle == false)
        setState(() {
          showTitle = true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      showTitle ? widget.title.inCaps : "",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
