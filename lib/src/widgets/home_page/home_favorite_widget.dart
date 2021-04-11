import 'package:betsy_s_cookbook/src/widgets/recipe_widget.dart';
import 'package:flutter/material.dart';

class HomeFavoriteWidget extends StatelessWidget {
  const HomeFavoriteWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RecipeWidget("/"),
    );
  }
}
