import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/widgets/time_sleep_search.dart';
import 'package:flutter/material.dart';

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
              FutureBuilder(
                future: db.getRecipeByTitle(_text),
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
