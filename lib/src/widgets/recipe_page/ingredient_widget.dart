import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/models/ingredient_model.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatefulWidget {
  final IngredientsHive ingredients;
  IngredientWidget({Key? key, required this.ingredients}) : super(key: key);

  @override
  _IngredientWidgetState createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        "${widget.ingredients.amount} ${widget.ingredients.measure} de ${widget.ingredients.ingredient}",
        style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
      ),
      onLongPress: () {},
      onPressed: () {},
    );
  }
}
