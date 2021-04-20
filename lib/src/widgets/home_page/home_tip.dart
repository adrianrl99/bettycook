import 'package:bettycook/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeTip extends StatelessWidget {
  const HomeTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Tip para ti",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: Hive.box(tipsBox).listenable(),
              builder: (BuildContext context, Box box, _) {
                if (box.isNotEmpty)
                  return ListTile(
                    title: Text(box.get('tip')[1]),
                  );
                else
                  return ListTile(
                    title: Center(
                      child: Text("No hay tip hoy"),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
