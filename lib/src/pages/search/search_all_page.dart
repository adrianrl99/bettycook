import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/widgets/time_sleep_search.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class SearchAllPage extends StatefulWidget {
  static const routeName = "/search";

  const SearchAllPage({Key? key}) : super(key: key);

  @override
  _SearchAllPageState createState() => _SearchAllPageState();
}

class _SearchAllPageState extends State<SearchAllPage> {
  final String title = "Buscar";
  final _timeSleepSearch = TimeSleepSearch(milliseconds: 1000);
  String _text = "";
  bool _isStop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
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
              ValueListenableBuilder(
                valueListenable: hiveDB.recipesBoxBaseListable(),
                builder: (BuildContext context, Box<RecipeHive> recipesBox,
                    Widget? child) {
                  Iterable<RecipeHive> recipes = recipesBox.values.where(
                      (element) => element.title.format.contains(_text.format));
                  return Expanded(
                    child: ListView(
                      children: <Widget>[
                        if (recipes.length > 0)
                          for (RecipeHive recipe in recipes)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: RecipeWidget(
                                recipe: recipe,
                              ),
                            )
                        else
                          Container(
                            alignment: Alignment.center,
                            child: Text("No se encontraron resultados"),
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
