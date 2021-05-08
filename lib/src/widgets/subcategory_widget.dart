import 'package:bettycook/src/pages/subcategory_page.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';

class SubCategoryWidget extends StatelessWidget {
  final SubCategoryHive subcategory;
  const SubCategoryWidget({required this.subcategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(SubCategoryPage.routeName, arguments: subcategory);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4,
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: MemoryImage(
                  decodeImage(subcategory.image),
                ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black.withOpacity(0.35),
              child: ListTile(
                title: Text(
                  this.subcategory.name.inCaps,
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
    );
  }
}
