import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/home_page/home_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  _HomeCategoriesWidgetState createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        fit: FlexFit.tight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ValueListenableBuilder(
            valueListenable: hiveDB.categoriesBoxListable(),
            builder: (BuildContext context, Box<CategoryHive> categoriesBox,
                Widget? child) {
              return Row(
                children: <HomeCategoryWidget>[
                  for (CategoryHive category in categoriesBox.values)
                    HomeCategoryWidget(
                      category: category,
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
