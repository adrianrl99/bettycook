import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon/icon.png"),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Creditos"),
              onTap: () =>
                  Navigator.of(context).pushNamed(CreditsPage.routeName),
            )
          ],
        ),
      ),
    );
  }
}
