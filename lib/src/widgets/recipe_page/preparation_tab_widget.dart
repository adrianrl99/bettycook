import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/models/preparation_model.dart';
import 'package:flutter/material.dart';

class PreparationTabWidget extends StatefulWidget {
  final int id;
  const PreparationTabWidget({required this.id, Key? key}) : super(key: key);

  @override
  _PreparationTabWidgetState createState() => _PreparationTabWidgetState();
}

class _PreparationTabWidgetState extends State<PreparationTabWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getRecipePreparation(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length > 0) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                for (PreparationModel preparation in snapshot.data)
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          preparation.target,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: <Widget>[
                            for (int i = 0;
                                i < preparation.preparation.length;
                                i++)
                              ListTile(
                                title: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text("${(i + 1).toString()} -"),
                                    ),
                                    Text(preparation.preparation[i]),
                                  ],
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
              ],
            );
          } else
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text("Esta receta no tiene preparación"),
              ),
            );
        } else
          return Container();
      },
    );
  }
}
