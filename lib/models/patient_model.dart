import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class PatientModel {
  final String name;
  final int age;
  final Gender gender;
  final int heightCm;
  final int weightKg;

  PatientModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.heightCm,
    required this.weightKg,
  });
}
