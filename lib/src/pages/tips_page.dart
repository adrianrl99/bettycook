import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  static const routeName = "/tips";

  const TipsPage({Key key}) : super(key: key);

  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  final String title = "Tips";
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(SearchTipsPage.routeName);
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: db.getTips(),
          builder: (BuildContext context, snapshot) {
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
