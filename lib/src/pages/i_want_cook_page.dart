import 'package:flutter/material.dart';

class IWantCookPage extends StatelessWidget {
  static const routeName = "/i_want_cook";
  static const title = '¡Quiero cocinar!';

  const IWantCookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
