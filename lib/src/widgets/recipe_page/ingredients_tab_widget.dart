import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/models/ingredient_model.dart';
import 'package:bettycook/src/widgets/recipe_page/ingredient_widget.dart';
import 'package:flutter/material.dart';

class IngredientsTabWidget extends StatefulWidget {
  final int id;
  const IngredientsTabWidget({required this.id, Key? key}) : super(key: key);

  @override
  _IngredientsTabWidgetState createState() => _IngredientsTabWidgetState();
}

class _IngredientsTabWidgetState extends State<IngredientsTabWidget> {
  void _showDialog(BuildContext context, String comment) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Comentario"),
            content: Text(comment),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("SALIR"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getRecipeIngredients(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length > 0)
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                for (IngredientModel ingredient in snapshot.data)
                  Column(
                    children: <Widget>[
                      if (ingredient.target.isNotEmpty)
                        ListTile(
                          title: Text(
                            ingredient.target,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: <Widget>[
                            for (IngredientsModel ingredients
                                in ingredient.ingredients)
                              ListTile(
                                trailing: ingredients.comment.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.help_outline),
                                        onPressed: () => _showDialog(
                                            context, ingredients.comment),
                                      )
                                    : null,
                                title: IngredientWidget(
                                  ingredients: ingredients,
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  )
              ],
            );
          else
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text("Esta receta no tiene ingredientes"),
              ),
            );
        } else
          return Container();
      },
    );
  }
}
