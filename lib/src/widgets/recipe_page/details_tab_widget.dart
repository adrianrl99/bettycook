import 'package:betsy_s_cookbook/src/database.dart';
import 'package:flutter/material.dart';

class DetailsTabWidget extends StatefulWidget {
  final int id;
  const DetailsTabWidget(this.id, {Key key}) : super(key: key);

  @override
  _DetailsTabWidgetState createState() => _DetailsTabWidgetState();
}

class _DetailsTabWidgetState extends State<DetailsTabWidget> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getRecipeDetails(widget.id),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Text(snapshot.data);
        else
          return Container();
      },
    );
  }
}
