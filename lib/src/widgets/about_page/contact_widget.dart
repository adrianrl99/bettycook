import 'package:bettycook/src/utils.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Center(
              child: Text(
            "Puedes contactarnos por",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Column(
                children: [
                  Icon(Icons.send),
                  Text("Telegram"),
                ],
              ),
              onPressed: () => launchURL("https://t.me/bettycook"),
            ),
            TextButton(
              child: Column(
                children: [
                  Icon(Icons.mail),
                  Text("Correo"),
                ],
              ),
              onPressed: () => launchURL("mailto:bettycooksoporte@gmail.com"),
            )
          ],
        )
      ],
    );
  }
}
