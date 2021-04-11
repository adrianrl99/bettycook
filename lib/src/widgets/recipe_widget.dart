import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  final String recipePath;
  final String title = "Titulo de receta";
  const RecipeWidget(this.recipePath, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(this.recipePath);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/default.png"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black.withOpacity(0.35),
              child: ListTile(
                title: Text(
                  this.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.favorite_border,
                  color: Colors.red[800],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
