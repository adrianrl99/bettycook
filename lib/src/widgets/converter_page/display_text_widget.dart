import 'package:bettycook/src/widgets/converter_page/display/dropdown_units_widget.dart';
import 'package:bettycook/src/widgets/converter_page/display/input_text_widget.dart';
import 'package:flutter/material.dart';

class DisplayTextWidget extends StatelessWidget {
  final String label;
  final String dropdownValueTop;
  final String dropdownValueBottom;
  final Function onChange;
  final String value;
  const DisplayTextWidget(
      {required this.label,
      required this.value,
      required this.dropdownValueTop,
      required this.dropdownValueBottom,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DropDownUnitsWidget(
              dropdownValueTop: dropdownValueTop,
              dropdownValueBottom: dropdownValueBottom,
              onChange: onChange),
          InputTextWidget(label: label, value: value),
        ],
      ),
    );
  }
}
