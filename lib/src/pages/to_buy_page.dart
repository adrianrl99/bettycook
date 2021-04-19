import 'package:flutter/material.dart';

class ToBuyPage extends StatelessWidget {
  static const routeName = "/to_buy";
  static const title = "Por Comprar";

  const ToBuyPage() : super();

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
