import 'package:bettycook/src/widgets/settings_modal.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

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

  void _onTap(int index) {
    if (index == 3)
      _showSettings();
    else
      _pushRoute(index);
  }

  void _pushRoute(int index) {
    String routePath = ModalRoute.of(context).settings.name;
    if (routePath != routePaths[index])
      switch (routePaths[index]) {
        case HomePage.routeName:
          Navigator.of(context)
              .popUntil(ModalRoute.withName(HomePage.routeName));
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

  void _showSettings() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: SettingsModal(),
      ),
    );
  }

  void _onInit(BuildContext context) {
    switch (ModalRoute.of(context).settings.name) {
      case HomePage.routeName:
        setState(() {
          _currentIndex = 0;
        });
        break;
      case FavoritesPage.routeName:
      case SearchFavoritesPage.routeName:
        setState(() {
          _currentIndex = 1;
        });
        break;
      case TipsPage.routeName:
      case SearchTipsPage.routeName:
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
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favoritos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb),
          label: "Tips",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Opciones",
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: _currentIndex == 0 &&
              ModalRoute.of(context).settings.name != HomePage.routeName
          ? Theme.of(context).unselectedWidgetColor
          : Theme.of(context).primaryColor,
      onTap: (index) => _onTap(index),
    );
  }
}
