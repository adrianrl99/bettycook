import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  static const routeName = "/recipe";
  final String title = "Receta";

  const RecipePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              actions: <IconButton>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red[800],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                  ),
                  onPressed: () {},
                )
              ],
              title: Text(this.title),
              expandedHeight: 320,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/default.png"),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              pinned: true,
              bottom: TabBar(
                indicatorWeight: 4,
                labelColor: Colors.white,
                tabs: <Tab>[
                  Tab(
                    child: Text("Detalles"),
                  ),
                  Tab(
                    child: Text("Ingredientes"),
                  ),
                  Tab(
                    child: Text("Preparacion"),
                  )
                ],
              ),
            )
          ],
          body: TabBarView(
            children: <Widget>[
              Text("Detalles"),
              Text("Ingredientes"),
              Text("Preparacion"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
