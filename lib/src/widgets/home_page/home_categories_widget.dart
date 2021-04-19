import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/home_page/home_category_widget.dart';
import 'package:flutter/material.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget() : super();

  @override
  _HomeCategoriesWidgetState createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        fit: FlexFit.tight,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            child: FutureBuilder(
              future: db.getCategories(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (CategoryModel category in snapshot.data)
                        HomeCategoryWidget(category: category)
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
