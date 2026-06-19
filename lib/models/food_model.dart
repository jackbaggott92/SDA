

class FoodModel {
  final String name;
  final int fullCalories;
  final int fullProtein;
  int partialCalories = 0;
  int partialProtein = 0;

  FoodModel({
    required this.name,
    required this.fullCalories,
    required this.fullProtein,
  });
}
