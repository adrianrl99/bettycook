import 'package:bettycook/src/widgets/about_page/app_version_widget.dart';
import 'package:bettycook/src/widgets/about_page/contact_widget.dart';
import 'package:bettycook/src/widgets/about_page/work_team_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about";
  static const title = "Sobre BettyCook";
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Container(
          // child: ListView(
          //   children: <Widget>[
          //     ContactWidget(),
          //     SizedBox(height: 20),
          //     WordTeamWidget(),
          //     SizedBox(height: 20),
          //     AppVersionWidget(),
          //   ],
          // ),
          ),
    );
  }
}
