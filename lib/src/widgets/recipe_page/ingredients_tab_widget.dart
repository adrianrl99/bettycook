import 'package:bettycook/src/database.dart';
import 'package:flutter/material.dart';

class IngredientsTabWidget extends StatefulWidget {
  final int id;
  const IngredientsTabWidget({required this.id}) : super();

  @override
  _IngredientsTabWidgetState createState() => _IngredientsTabWidgetState();
}

class _IngredientsTabWidgetState extends State<IngredientsTabWidget> {
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
