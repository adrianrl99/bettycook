import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<String> routePaths = [
    HomePage.routeName,
    FavoritesPage.routeName,
    TipsPage.routeName
  ];
  int _currentIndex = 0;

  void _pushRoute(int index) {
    String routePath = ModalRoute.of(context)!.settings.name!;

    switch (routePaths[index]) {
      case HomePage.routeName:
        Navigator.of(context).popUntil(ModalRoute.withName(routePaths[index]));
        break;
      default:
        if (routePath == TipsPage.routeName &&
                routePaths[index] == FavoritesPage.routeName ||
            routePath == FavoritesPage.routeName &&
                routePaths[index] == TipsPage.routeName)
          Navigator.of(context).pushReplacementNamed(routePaths[index]);
        else
          Navigator.of(context).pushNamed(routePaths[index]);
    }
  }

  void _onInit(BuildContext context) {
    switch (ModalRoute.of(context)!.settings.name) {
      case HomePage.routeName:
        setState(() {
          _currentIndex = 0;
        });
        break;
      case FavoritesPage.routeName:
        setState(() {
          _currentIndex = 1;
        });
        break;
      case TipsPage.routeName:
        setState(() {
          _currentIndex = 2;
        });
        break;
      default:
        setState(() {
          _currentIndex = 0;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    _onInit(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: HomePage.title,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: FavoritesPage.title,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb),
          label: TipsPage.title,
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: _currentIndex == 0 &&
              ModalRoute.of(context)!.settings.name != HomePage.routeName
          ? Theme.of(context).unselectedWidgetColor
          : null,
      onTap: (index) => _pushRoute(index),
    );
  }
}
