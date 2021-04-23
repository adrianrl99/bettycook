import 'package:flutter/material.dart';

class VoidButtonWidget extends StatelessWidget {
  const VoidButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
