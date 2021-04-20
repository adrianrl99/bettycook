import 'package:hive/hive.dart';

void toggleFavorite(Box box, int id, String title) {
  if (box.containsKey(id))
    box.delete(id);
  else
    box.put(id, [id, title]);
}

void addRecipeInCalendar(
    Box box, boxRecipe, int id, String title, DateTime dateTime) {
  if (!box.containsKey(id)) {
    box.put(id, [
      id,
      title,
      [dateTime],
    ]);
  } else if (boxRecipe != null) {
    if (!boxRecipe[2].contains(dateTime)) {
      boxRecipe[2].add(dateTime);
      box.put(id, boxRecipe);
    }
  }
}

void removeRecipeDateTimeInCalendar(
    Box box, boxRecipe, int id, DateTime dateTime) {
  boxRecipe[2].remove(dateTime);
  box.put(id, boxRecipe);
}
