import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  void _onTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/favorites");
        break;
      case 1:
        Navigator.of(context).pushNamed("/tips");
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
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
      onTap: (index) => _onTap(index, context),
    );
  }
}
