import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final String value;
  const InputTextWidget({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.topLeft,
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: this.label,
            labelStyle: TextStyle(color: Colors.white),
          ),
          controller: TextEditingController(text: this.value),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
