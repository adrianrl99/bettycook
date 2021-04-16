import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

void toggleFavorite(Box box, int id, String title) {
  if (box.containsKey(id))
    box.delete(id);
  else
    box.put(id, [id, title]);
}

void launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'No se pudo abrir $url';
