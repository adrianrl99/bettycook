import 'dart:io';

import 'package:bettycook/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:path/path.dart';
import 'package:share/share.dart';

class ShareButtonWidget extends StatelessWidget {
  final RecipeModel recipe;
  const ShareButtonWidget({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () async {
        final path = await getApplicationDocumentsDirectory();
        final RenderBox box = context.findRenderObject() as RenderBox;
        File imgFile = new File(join(path.path, 'share.png'));
        ByteData data = await rootBundle
            .load("assets/images/recipes/${this.recipe.title.format}.png");
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await imgFile.writeAsBytes(bytes, flush: true);
        await Share.shareFiles([imgFile.path],
            subject: 'BettyCook',
            text: this.recipe.title,
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        await imgFile.delete();
      },
    );
  }
}
