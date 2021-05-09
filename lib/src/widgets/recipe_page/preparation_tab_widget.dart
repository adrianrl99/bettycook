import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';

class PreparationTabWidget extends StatelessWidget {
  final List<PreparationHive> preparation;
  final String title;
  const PreparationTabWidget(
      {required this.preparation, required this.title, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 16.0),
      children: <Widget>[
        if (this.preparation.isNotEmpty)
          for (PreparationHive _preparation in this.preparation)
            Column(
              children: <Widget>[
                if (_preparation.target != this.title)
                  ListTile(
                    title: Text(
                      _preparation.target,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      for (int i = 0; i < _preparation.preparation.length; i++)
                        ListTile(
                          title: Text(
                              "${(i + 1).toString()} - ${_preparation.preparation[i]}"),
                        )
                    ],
                  ),
                )
              ],
            )
        else
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Text("Esta receta no tiene preparación"),
            ),
          ),
      ],
    );
  }
}
