import 'package:flutter/material.dart';

class HomeNotFavoriteWidget extends StatelessWidget {
  const HomeNotFavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Center(
        child: Container(
          child: Text("No has seleccionado ninguna receta como favorito"),
        ),
      ),
    );
  }
}
