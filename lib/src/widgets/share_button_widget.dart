import 'dart:io';

import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:share/share.dart';

class ShareButtonWidget extends StatelessWidget {
  final RecipeHive recipe;
  const ShareButtonWidget({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.share,
        color: Colors.white,
      ),
      onPressed: () async {
        final path = await getApplicationDocumentsDirectory();
        final RenderBox box = context.findRenderObject() as RenderBox;

        File imgFile = new File(join(path.path, 'share.png'));
        await imgFile.writeAsBytes(decodeImage(this.recipe.image), flush: true);

        await Share.shareFiles([imgFile.path],
            text:
                "${this.recipe.title} en BettyCook\nDescarga BettyCook en https://www.apklis.cu/application/cu.bettycook.android\nTus recetas en un solo lugar",
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);

        await imgFile.delete();
      },
    );
  }
}
