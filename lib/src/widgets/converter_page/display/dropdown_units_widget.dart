import 'package:bettycook/src/constants.dart';
import 'package:flutter/material.dart';

class DropDownUnitsWidget extends StatelessWidget {
  final String dropdownValueTop;
  final String dropdownValueBottom;
  final Function onChange;
  const DropDownUnitsWidget(
      {required this.dropdownValueTop,
      required this.dropdownValueBottom,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.topLeft,
        child: DropdownButton(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          dropdownColor: Theme.of(context).primaryColor,
          value: this.dropdownValueTop,
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) => this.onChange(newValue),
          items: <DropdownMenuItem<String>>[
            for (String key in listUnits.keys)
              if (key != this.dropdownValueBottom)
                DropdownMenuItem(
                  value: key,
                  child: Text(
                    listUnits.entries
                        .firstWhere((element) => element.key == key)
                        .value,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
