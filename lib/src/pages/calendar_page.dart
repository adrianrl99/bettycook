import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  static const routeName = "/calendar";
  static const title = "Calendario";

  const CalendarPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
