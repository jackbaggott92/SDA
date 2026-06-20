class ONSModel {
  final String name;
  final double fullCalories;
  final double fullProtein;
  final double portionEaten;
  final double volume;
  final int iddsi;


  ONSModel({
    required this.name,
    required this.fullCalories,
    required this.fullProtein,
    this.portionEaten = 1.0,
    required this.volume,
    required this.iddsi,

  });

  ONSModel copyWith({String? name, double? fullCalories, double? fullProtein, double? portionEaten, double? volume, int? iddsi}) {
    return ONSModel(
      name: name ?? this.name,
      fullCalories: fullCalories ?? this.fullCalories,
      fullProtein: fullProtein ?? this.fullProtein,
      portionEaten: portionEaten ?? this.portionEaten,
      volume: volume ?? this.volume,
      iddsi: iddsi ?? this.iddsi,
    );
  }
}
