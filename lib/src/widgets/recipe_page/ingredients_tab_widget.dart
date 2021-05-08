import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';

class IngredientsTabWidget extends StatelessWidget {
  final List<IngredientHive> ingredients;
  final String title;
  const IngredientsTabWidget(
      {required this.ingredients, required this.title, Key? key})
      : super(key: key);

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
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        if (this.ingredients.isNotEmpty)
          for (IngredientHive ingredient in this.ingredients)
            Column(
              children: <Widget>[
                if (ingredient.target != this.title)
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
                      for (IngredientsHive _ingredients
                          in ingredient.ingredients)
                        ListTile(
                          trailing: _ingredients.comment.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.help_outline,
                                  ),
                                  onPressed: () => _showDialog(
                                      context, _ingredients.comment),
                                )
                              : null,
                          title: Text(
                            "${_ingredients.amount} ${_ingredients.measure} de ${_ingredients.ingredient}",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color),
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
              child: Text("Esta receta no tiene ingredientes"),
            ),
          ),
      ],
    );
  }
}
