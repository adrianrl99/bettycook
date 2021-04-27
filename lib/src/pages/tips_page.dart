import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  static const routeName = "/tips";
  static const String title = "Tips";

  const TipsPage({Key? key}) : super(key: key);

  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TipsPage.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: db.getTips(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: <Widget>[
                  for (TipModel tip in snapshot.data)
                    ListTile(
                      title: Text(tip.tip),
                    )
                ],
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
