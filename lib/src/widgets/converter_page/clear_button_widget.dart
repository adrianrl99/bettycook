import 'package:flutter/material.dart';

class ClearButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;

  const ClearButtonWidget(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Container(
            height: double.infinity,
            alignment: Alignment.center,
            child: Text(
              this.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
