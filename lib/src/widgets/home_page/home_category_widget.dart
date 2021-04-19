import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class HomeCategoryWidget extends StatelessWidget {
  final CategoryModel category;
  const HomeCategoryWidget({required this.category}) : super();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(CategoryPage.routeName, arguments: category);
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
                  image: AssetImage(
                      "assets/images/categories/${this.category.name}.png"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.black.withOpacity(0.35),
                child: ListTile(
                  title: Text(
                    this.category.name.inCaps,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
