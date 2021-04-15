import 'package:bettycook/src/models/models.dart';
import 'package:hive/hive.dart';

void toggleFavorite(Box box, int id, String title) {
  if (box.containsKey(id))
    box.delete(id);
  else
    box.put(id, [id, title]);
}
