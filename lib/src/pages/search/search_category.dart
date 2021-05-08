import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/widgets/time_sleep_search.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class SearchCategoryPage extends StatefulWidget {
  static const routeName =
      "${SearchAllPage.routeName}${CategoryPage.routeName}";
  // final CategoryHive category;

  const SearchCategoryPage({
    // required this.category,
    Key? key,
  }) : super(key: key);

  @override
  _SearchCategoryPageState createState() => _SearchCategoryPageState();
}

class _SearchCategoryPageState extends State<SearchCategoryPage> {
  final _timeSleepSearch = TimeSleepSearch(milliseconds: 1000);
  String _text = "";
  bool _isStop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Buscar en ${this.widget.category.name}"),
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
            // if (_isStop && _text.length > 3)
            //   ValueListenableBuilder(
            //     valueListenable: hiveDB.recipesBoxListable(),
            //     builder: (BuildContext context, Box<RecipeHive> recipesBox,
            //         Widget? child) {
            //       Iterable<RecipeHive> recipes = recipesBox.values.where(
            //           (element) =>
            //               element.title.format.contains(_text.format) &&
            //               element.subcategory.category.id ==
            //                   widget.category.id);
            //       return Expanded(
            //         child: ListView(
            //           children: <Widget>[
            //             if (recipes.length > 0)
            //               for (RecipeHive recipe in recipes)
            //                 Container(
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: 16.0, vertical: 8.0),
            //                   child: RecipeWidget(
            //                     recipe: recipe,
            //                   ),
            //                 )
            //             else
            //               Container(
            //                 alignment: Alignment.center,
            //                 child: Text("No se encontraron resultados"),
            //               )
            //           ],
            //         ),
            //       );
            //     },
            //   )
            // else
            //   Container(
            //     alignment: Alignment.center,
            //     child: Text(_text),
            //   )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
