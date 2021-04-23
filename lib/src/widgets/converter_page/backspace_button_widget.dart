import 'package:flutter/material.dart';

class BackspaceButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Function onLongPress;

  const BackspaceButtonWidget(
      {required this.onPressed, required this.onLongPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onPressed(),
          onLongPress: () => onLongPress(),
          child: Container(
            height: double.infinity,
            alignment: Alignment.center,
            child: Icon(Icons.backspace_outlined, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
