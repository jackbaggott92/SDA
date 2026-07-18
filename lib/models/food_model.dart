class FoodModel {
  final String name;
  final int fullCalories;
  final double fullProtein;
  final double portionEaten;
  final int volume;
  final double iddsi;

  FoodModel({
    required this.name,
    required this.fullCalories,
    required this.fullProtein,
    this.portionEaten = 1.0,
    this.volume = 0,
    this.iddsi = 0
  });

  FoodModel copyWith({String? name, double? fullCalories, double? fullProtein, double? portionEaten, double? volume, double? iddsi}) {
    return FoodModel(
      name: name ?? this.name,
      fullCalories: (fullCalories ?? this.fullCalories).round(),
      fullProtein: fullProtein ?? this.fullProtein,
      portionEaten: portionEaten ?? this.portionEaten,
      volume: (volume ?? this.volume).round(),
      iddsi: iddsi ?? this.iddsi
      
    );
  }
}
