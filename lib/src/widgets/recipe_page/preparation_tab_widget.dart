import 'package:bettycook/src/adapters/adapters.dart';
import 'package:flutter/material.dart';

class PreparationTabWidget extends StatelessWidget {
  final List<PreparationHive> preparation;
  const PreparationTabWidget({required this.preparation, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        if (this.preparation.isNotEmpty)
          for (PreparationHive _preparation in this.preparation)
            Column(
              children: <Widget>[
                if (_preparation.target.isNotEmpty)
                  ListTile(
                    title: Text(
                      _preparation.target,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      for (int i = 0; i < _preparation.preparation.length; i++)
                        ListTile(
                          title: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text("${(i + 1).toString()} -"),
                              ),
                              Text(_preparation.preparation[i]),
                            ],
                          ),
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
