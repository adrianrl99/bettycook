import 'package:bettycook/src/convert_functions.dart';
import 'package:bettycook/src/widgets/converter_page/backspace_button_widget.dart';
import 'package:bettycook/src/widgets/converter_page/button_widget.dart';
import 'package:bettycook/src/widgets/converter_page/clear_button_widget.dart';
import 'package:bettycook/src/widgets/converter_page/display/swap_display_widget.dart';
import 'package:bettycook/src/widgets/converter_page/display_text_widget.dart';
import 'package:bettycook/src/widgets/converter_page/void_button_widget.dart';
import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  static const routeName = "/converter";
  static const title = 'Convertidor';

  const ConverterPage({Key? key}) : super(key: key);

  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String toConvert = "";
  String converted = "";
  String dropdownValueToConvert = "g";
  String dropdownValueConverted = "kg";

  void _clearDisplay() {
    setState(() {
      toConvert = "";
    });
  }

  void _addTextDisplay(newValue) {
    List splitText = toConvert.split("");
    splitText.add(newValue);
    setState(() {
      toConvert = splitText.join();
    });
  }

  void _addCommaDisplay(newValue) {
    if (!toConvert.contains(newValue)) {
      List splitText = toConvert.split("");
      splitText.add(newValue);
      setState(() {
        toConvert = splitText.join();
      });
    }
  }

  void _removeLastChar() {
    if (toConvert.isNotEmpty) {
      List splitText = toConvert.split("");
      splitText.removeLast();
      setState(() {
        toConvert = splitText.join();
      });
    }
  }

  void _onUpdate() {
    setState(() {
      converted = convertUnit(
          from: dropdownValueToConvert,
          to: dropdownValueConverted,
          value: toConvert);
    });
  }

  @override
  Widget build(BuildContext context) {
    _onUpdate();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.3),
        title: Text(ConverterPage.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                child: Stack(
                  children: [
                    SwapDisplayWidget(),
                    Container(
                      child: Column(
                        children: [
                          DisplayTextWidget(
                              label: "Entrada",
                              value: toConvert,
                              dropdownValueTop: dropdownValueToConvert,
                              dropdownValueBottom: dropdownValueConverted,
                              onChange: (String? newValue) {
                                setState(() {
                                  dropdownValueToConvert = newValue!;
                                });
                              }),
                          DisplayTextWidget(
                              label: "Salida",
                              value: converted,
                              dropdownValueTop: dropdownValueConverted,
                              dropdownValueBottom: dropdownValueToConvert,
                              onChange: (String? newValue) {
                                setState(() {
                                  dropdownValueConverted = newValue!;
                                });
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          VoidButtonWidget(),
                          ClearButtonWidget(
                              text: "C", onPressed: _clearDisplay),
                          BackspaceButtonWidget(
                              onPressed: _removeLastChar,
                              onLongPress: _clearDisplay),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          ButtonWidget(text: "7", onPressed: _addTextDisplay),
                          ButtonWidget(text: "8", onPressed: _addTextDisplay),
                          ButtonWidget(text: "9", onPressed: _addTextDisplay),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          ButtonWidget(text: "4", onPressed: _addTextDisplay),
                          ButtonWidget(text: "5", onPressed: _addTextDisplay),
                          ButtonWidget(text: "6", onPressed: _addTextDisplay),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          ButtonWidget(text: "1", onPressed: _addTextDisplay),
                          ButtonWidget(text: "2", onPressed: _addTextDisplay),
                          ButtonWidget(text: "3", onPressed: _addTextDisplay),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          VoidButtonWidget(),
                          ButtonWidget(text: "0", onPressed: _addTextDisplay),
                          ButtonWidget(text: ".", onPressed: _addCommaDisplay),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
