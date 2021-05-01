import 'package:bettycook/src/adapters/adapters.dart';
import 'package:hive/hive.dart';

void addRecipeInCalendar(
    RecipeHive recipe, Box<RecipeHive> recipesBox, DateTime dateTime,
    {DateTime? oldDateTime}) {
  if (oldDateTime != null && recipe.calendar.contains(oldDateTime)) {
    recipe.calendar.remove(oldDateTime);
  }
  if (!recipe.calendar.contains(dateTime)) {
    recipe.calendar.add(dateTime);
    recipe.calendar.sort();
    recipesBox.put(recipe.id, recipe);
  }
}
