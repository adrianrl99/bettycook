import 'package:bettycook/src/utils.dart';
import 'package:flutter/material.dart';

class WordTeamWidget extends StatelessWidget {
  const WordTeamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Center(
            child: Text(
              "Equipo de trabajo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              "Desarrollador y diseñador UI/UX",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Center(
              child: GestureDetector(
            onTap: () => launchURL("https://porfolio-adrianrl99.vercel.app/"),
            child: Text(
              "Adrian López Cintas",
            ),
          )),
        ),
        ListTile(
          title: Center(
            child: Text(
              "Diseñador audiovisual",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Center(
              child: GestureDetector(
            onTap: () =>
                launchURL("https://www.instagram.com/markus_anthony.film"),
            child: Text(
              "Marcos",
            ),
          )),
        ),
        ListTile(
          title: Center(
            child: Text(
              "Editora de contenido",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Center(
              child: GestureDetector(
            child: Text(
              "Betsy Cintas",
            ),
          )),
        ),
      ],
    );
  }
}
