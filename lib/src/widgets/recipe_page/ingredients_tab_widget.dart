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

  String ingredientText(IngredientsHive _ingredients) {
    String amount = "";
    String measure = "";
    String of = "";
    String ingredient = "";
    if (_ingredients.amount != 0.0) {
      if (_ingredients.amount.toInt() == _ingredients.amount)
        amount = _ingredients.amount.toInt().toString();
      else if (_ingredients.amount == 0.25)
        amount = "¼";
      else if (_ingredients.amount == 0.5)
        amount = "½";
      else if (_ingredients.amount == 0.75)
        amount = "¾";
      else if (_ingredients.amount == 0.33)
        amount = "⅓";
      else if (_ingredients.amount == 0.66)
        amount = "⅔";
      else if (_ingredients.amount - _ingredients.amount.toInt() == 0.25)
        amount = _ingredients.amount.toInt().toString() + "¼";
      else if (_ingredients.amount - _ingredients.amount.toInt() == 0.5)
        amount = _ingredients.amount.toInt().toString() + "½";
      else if (_ingredients.amount - _ingredients.amount.toInt() == 0.75)
        amount = _ingredients.amount.toInt().toString() + "¾";
      else if (_ingredients.amount - _ingredients.amount.toInt() == 0.33)
        amount = _ingredients.amount.toInt().toString() + "⅓";
      else if (_ingredients.amount - _ingredients.amount.toInt() == 0.66)
        amount = _ingredients.amount.toInt().toString() + "⅔";
      else
        amount = _ingredients.amount.toString();
      amount = amount + " ";
    }

    if (_ingredients.measure.isNotEmpty) {
      measure = _ingredients.measure;
      of = " de ";
    }
    if (_ingredients.ingredient.isNotEmpty)
      ingredient = _ingredients.ingredient;
    return amount + measure + of + ingredient;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 16.0),
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
                            ingredientText(_ingredients),
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
