import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/widgets/time_sleep_search.dart';
import 'package:flutter/material.dart';

class SearchSubCategoryPage extends StatefulWidget {
  static const routeName =
      "${SearchAllPage.routeName}${SubCategoryPage.routeName}";
  final SubCategoryModel subcategory;

  const SearchSubCategoryPage({required this.subcategory, Key? key})
      : super(key: key);

  @override
  _SearchSubCategoryPageState createState() => _SearchSubCategoryPageState();
}

class _SearchSubCategoryPageState extends State<SearchSubCategoryPage> {
  RecipesDatabase db = RecipesDatabase();
  final _timeSleepSearch = TimeSleepSearch(milliseconds: 1000);
  String _text = "";
  bool _isStop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar en ${this.widget.subcategory.name}"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Buscar',
                ),
                onChanged: (String text) {
                  if (text != this._text) {
                    if (text.length > 3) {
                      setState(() {
                        _isStop = false;
                        _text = "";
                      });
                      _timeSleepSearch.run(() {
                        setState(() {
                          _isStop = true;
                          _text = text;
                        });
                      });
                    } else {
                      setState(() {
                        _isStop = false;
                        _text = "Escribe más de 3 caracteres";
                      });
                    }
                  }
                },
              ),
            ),
            if (_isStop && _text.length > 3)
              FutureBuilder(
                future: db.getRecipeByTitleAndCategory(
                    _text, widget.subcategory.category, widget.subcategory.id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Expanded(
                    child: ListView(
                      children: <Widget>[
                        if (snapshot.connectionState == ConnectionState.done)
                          if (snapshot.data != null)
                            for (RecipeModel recipe in snapshot.data)
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 16.0,
                                    right: 16.0),
                                child: RecipeWidget(recipe: recipe),
                              )
                          else
                            Container(
                              alignment: Alignment.center,
                              child: Text("No se encontraron resultados"),
                            )
                        else
                          Container(
                            alignment: Alignment.center,
                            child: Text("Buscando..."),
                          )
                      ],
                    ),
                  );
                },
              )
            else
              Container(
                alignment: Alignment.center,
                child: Text(_text),
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
