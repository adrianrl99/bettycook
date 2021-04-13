import 'package:hive/hive.dart';

void toggleFavorite(List favorites, Box box, int id) {
  if (!favorites.contains(id))
    box.put("favorites", [...favorites, id]);
  else {
    var newFavorites = favorites.where((element) => element != id);
    box.put("favorites", [...newFavorites]);
  }
}
