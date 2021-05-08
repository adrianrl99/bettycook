import 'package:flutter/material.dart';

class ErrorApp extends StatefulWidget {
  @override
  _ErrorAppState createState() => _ErrorAppState();
}

class _ErrorAppState extends State<ErrorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BettyCook Error",
      home: Scaffold(
        body: Center(
          child: Text("Por favor descarga la version original de la app"),
        ),
      ),
    );
  }
}
