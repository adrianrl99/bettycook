import 'package:bettycook/src/database.dart';
import 'package:flutter/material.dart';

class PreparationTabWidget extends StatefulWidget {
  final int id;
  const PreparationTabWidget({required this.id, Key? key}) : super(key: key);

  @override
  _PreparationTabWidgetState createState() => _PreparationTabWidgetState();
}

class _PreparationTabWidgetState extends State<PreparationTabWidget> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getRecipeDetails(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Text(snapshot.data);
        else
          return Container();
      },
    );
  }
}
