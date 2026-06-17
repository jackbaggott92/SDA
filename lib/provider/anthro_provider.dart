import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

enum Height { cm, ft }

enum Weight { kg, lb, st }

class AnthroProvider extends ChangeNotifier {
  //----------------------------Age-------------------------//

  int _age = 0;
  int get age => _age;

  void setAge(int newAge) {
    _age = newAge;
    notifyListeners();
    print(_age);
  }

  void incrementAge() {
    if (_age < 130) {
      _age++;
      notifyListeners();
    }
  }

  void decrementAge() {
    if (_age > 0) {
      _age--;
      notifyListeners();
    }
  }

  //----------------------------------------------------------
  //--------------------------Gender--------------------------//

  Gender _gender = Gender.male;
  Gender get gender => _gender;

  void setGender(Gender newGender) {
    _gender = newGender;
    notifyListeners();
    print(_gender);
  }

  //------------------------------------------------------------
  //-------------------------height-----------------------------

  Height _heightUnits = Height.cm;
  Height get heightUnits => _heightUnits;

  int _cm = 0;
  int get cm => _cm;

  String get displayHeight {
    if (_heightUnits == Height.cm) {
      return '$_cm cm';
    } else {
      final totalInches = _cm / 2.54;
      final feet = totalInches ~/ 12;
      final inches = (totalInches % 12).round();
      return '$feet ft $inches in';
    }
  }

  void cycleHeightUnit() {
    final values = Height.values;
    final currentIndex = values.indexOf(_heightUnits);
    final nextIndex = (currentIndex + 1) % values.length;
    _heightUnits = values[nextIndex];
    notifyListeners();
  }

  void setHeightUnit(Height newHeightUnit) {
    _heightUnits = newHeightUnit;
    notifyListeners();
    print(_heightUnits);
  }

  void setCm(int newCm) {
    _cm = newCm;
    notifyListeners();
    print(_cm);
  }

  bool _isDecrementingCm = false;
  bool _isIncrementingCm = false;

  void startIncrementingCm() async {
    _isIncrementingCm = true;
    while (_isIncrementingCm) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (_cm < 250) {
        _cm++;
        notifyListeners();
      } else {
        break;
      }
    }
  }

  void stopIncrementingCm() {
    _isIncrementingCm = false;
  }

  void startDecrementingCm() async {
    _isDecrementingCm = true;
    while (_isDecrementingCm) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (_cm > 0) {
        _cm--;
        notifyListeners();
      } else {
        break;
      }
    }
  }

  void stopDecrementingCm() {
    _isDecrementingCm = false;
  }

  void incrementCm() {
    if (_cm < 250) {
      _cm++;
      notifyListeners();
    }
  }

  void decrementCm() {
    if (_cm > 0) {
      _cm--;
      notifyListeners();
    }
  }

  //-------------------------------------------------------------
  //-------------------------weight------------------------------

  Weight _weightUnits = Weight.kg;
  Weight get weightUnits => _weightUnits;

  double _kg = 0;
  double get kg => double.parse(_kg.toStringAsFixed(1));

  double get totalLb => _kg * 2.204623;

  int get stones => (totalLb ~/ 14);

  int get lb => (totalLb % 14).round();

  double get stepSize {
    switch (_weightUnits) {
      case Weight.kg:
        return 0.1; // fine control
      case Weight.st:
      case Weight.lb:
        return 0.453592; // 1 lb
    }
  }

  void setWeight(double newWeight) {
    _kg = newWeight.clamp(0, 200);
    notifyListeners();
  }

  void cycleWeight() {
    final values = Weight.values;
    final currentIndex = values.indexOf(_weightUnits);
    final nextIndex = (currentIndex + 1) % values.length;
    _weightUnits = values[nextIndex];
    notifyListeners();
  }

  String get displayWeight {
    if (_weightUnits == Weight.kg) {
      return '${kg.toStringAsFixed(1)} kg';
    } else if (_weightUnits == Weight.st) {
      return '$stones st $lb lb';
    } else {
      return '${totalLb.toStringAsFixed(0)} lb';
    }
  }

  void incrementWeight() {
    if (_kg < 200) {
      _kg += stepSize;
    }

    notifyListeners();
  }

  bool _isIncrementing = false;

  void startIncrementingWeight() async {
    _isIncrementing = true;
    while (_isIncrementing) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_kg < 200) {
        _kg += stepSize;
        notifyListeners();
      }
    }
  }

  void stopIncrementingWeight() {
    _isIncrementing = false;
  }

  void decrementWeight() {
    _kg = (_kg - stepSize).clamp(0, double.infinity);
    notifyListeners();
  }

  bool _isDecrementing = false;

  void startDecrementingWeight() async {
    _isDecrementing = true;
    while (_isDecrementing) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_kg > 0) {
        _kg -= stepSize;
        notifyListeners();
      }
    }
  }

  void stopDecrementingWeight() {
    _isDecrementing = false;
  }

  //--------------------------previous weight--------------------------

  Weight _previousWeightUnits = Weight.kg;
  Weight get previousWeightUnits => _previousWeightUnits;

  double _previousKg = 0;
  double get previousKg => double.parse(_previousKg.toStringAsFixed(1));

  double get totalPreviousLb => _previousKg * 2.204623;
  int get previousStones => (totalPreviousLb ~/ 14);
  int get previousLb => (totalPreviousLb % 14).round();

  double get previousStepSize {
    switch (_previousWeightUnits) {
      case Weight.kg:
        return 0.1; // fine control
      case Weight.st:
      case Weight.lb:
        return 0.453592; // 1 lb
    }
  }

  void setPreviousWeight(double newPreviousWeight) {
    _previousKg = newPreviousWeight;
    notifyListeners();
  }

  void cyclePreviousWeight() {
    final values = Weight.values;
    final currentIndex = values.indexOf(_previousWeightUnits);
    final nextIndex = (currentIndex + 1) % values.length;
    _previousWeightUnits = values[nextIndex];
    notifyListeners();
  }

  String get displayPreviousWeight {
    if (_previousWeightUnits == Weight.kg) {
      return '${previousKg.toStringAsFixed(1)} kg';
    } else if (_previousWeightUnits == Weight.st) {
      return '$previousStones st $previousLb lb';
    } else {
      return '${totalPreviousLb.toStringAsFixed(0)} lb';
    }
  }

  void incrementPreviousWeight() {
    if (_previousKg < 200) {
      _previousKg += previousStepSize;
    }
    notifyListeners();
  }

  bool _isIncrementingPrevious = false;

  void startIncrementingPreviousWeight() async {
    _isIncrementingPrevious = true;
    while (_isIncrementingPrevious) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_previousKg < 200) {
        _previousKg += previousStepSize;
        notifyListeners();
      }
    }
  }

  void stopIncrementingPreviousWeight() {
    _isIncrementingPrevious = false;
  }

  void decrementPreviousWeight() {
    _previousKg = (_previousKg - previousStepSize).clamp(0, double.infinity);
    notifyListeners();
  }

  bool _isDecrementingPrevious = false;

  void startDecrementingPreviousWeight() async {
    _isDecrementingPrevious = true;
    while (_isDecrementingPrevious) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_previousKg > 0) {
        _previousKg -= previousStepSize;
        notifyListeners();
      }
    }
  }

  void stopDecrementingPreviousWeight() {
    _isDecrementingPrevious = false;
  }

  //---------------------------------------------------------------
  //-------------------------Weight change------------------------//

  double get weightChange => kg - previousKg;
  double get percentageWeightChange => (weightChange / previousKg) * 100;

  //-------------------------bmi---------------------------------

  double get bmi => kg / ((_cm / 100) * (_cm / 100));

  //------------------------------------------------------
  //--------------------------pal--------------------------

  double pal = 1;
  String get displayPal{
    if (pal >= 1 && pal <= 1.1) {
      return 'In bed and immobile: Acute illness/injury/post-surgery';
    } else if (pal > 1.1 && pal <= 1.2) {
      return 'In bed and/or sitting out: Hospital ward/Care home/home';
    } else if (pal > 1.2 && pal <= 1.25) {
      return 'Limited mobility: Hospital ward/Care home w/ FT care';
    } else if (pal > 1.25 && pal <= 1.4) {
      return 'Sedentarty: Care home or at home\n ';
    } else {
      return 'Unknown';
    }
  }

  void setPal(double newPal) {
    pal = (newPal * 100).round() / 100;
    notifyListeners();
    print(pal);
  }



  //-----------------------------------------------------
  //---------------------calories----------------------

  int calories = 0;
  int upperCalories = 0;
  double currentCalories = 0;

  double get lowerCalorieRange => (_kg * pal * calories);
  double get upperCalorieRange =>
      ((_kg * pal * upperCalories) < lowerCalorieRange)
      ? lowerCalorieRange + 1
      : (_kg * pal * upperCalories + 1);
  double get safeCurrentCalories =>
      currentCalories.clamp(lowerCalorieRange, upperCalorieRange);

  void setCalories(int newCalories) {
    calories = newCalories;
    currentCalories = currentCalories.clamp(
      lowerCalorieRange,
      upperCalorieRange,
    );
    notifyListeners();
    print(calories);
  }

  void setUpperCalories(int newUpperCalories) {
    upperCalories = newUpperCalories;
    currentCalories = currentCalories.clamp(
      lowerCalorieRange,
      upperCalorieRange,
    );
    notifyListeners();
    print(newUpperCalories);
  }

  void setCurrentCalories(double newCurrent) {
    currentCalories = newCurrent;
    notifyListeners();
    print(currentCalories);
  }

  //----------------------------------------------------------------------------
  //----------------------------------Protein-------------------------------------

  double lowerProtein = 0;
  double upperProtein = 0;
  double currentProtein = 0;

  double get lowerProteinRange => lowerProtein * _kg;
  double get upperProteinRange => ((upperProtein * _kg) < lowerProteinRange)
      ? lowerProteinRange + 0.001
      : (_kg * upperProtein + 0.001);
  double get safeCurrentProtein =>
      currentProtein.clamp(lowerProteinRange, upperProteinRange);

  double get currentProteinKcal => safeCurrentProtein * 4;

  double get distributionKcal => upperCalorieRange - currentProteinKcal;
  double get safeDistributionKcal => distributionKcal.clamp(0, double.infinity);

  void setLowerProtein(double newProtein) {
    lowerProtein = newProtein;
    currentProtein = currentProtein.clamp(lowerProteinRange, upperProteinRange);
    notifyListeners();
    print(lowerProtein);
  }

  void setUpperProtein(double newProtein) {
    upperProtein = newProtein;
    currentProtein = currentProtein.clamp(lowerProteinRange, upperProteinRange);
    notifyListeners();
    print(upperProtein);
  }

  void setCurrentProtein(double newCurrent) {
    currentProtein = newCurrent;
    notifyListeners();
    print(currentProtein);
  }

  //-----------------------------------------------------------------------
  //------------------------------fluid-----------------------------------

  int get fluidRecomendation => (_age > 60) ? 30 : 35;
  double get fluidRequirement => (fluidRecomendation * _kg);

  //------------------------------------------------------------------
  //------------------------------MUST---------------------------------

 bool isCheckedIll = false;
  bool isCheckedNoNutrition = false;

  void setIsCheckedIll(bool newValue) {
    isCheckedIll = newValue;
    notifyListeners();
  }

  void setIsCheckedNoNutrition(bool newValue) {
    isCheckedNoNutrition = newValue;
    notifyListeners();
  }

double get percentageWeightLoss {
  if (previousKg == 0) return 0;

  final loss = ((previousKg - kg) / previousKg) * 100;

  return loss < 0 ? 0 : loss;
}

  int get bmiMust => (bmi > 18.5 && bmi < 20)
      ? 1
      : (bmi < 18.5)
      ? 2
      : 0;
  int get unplannedMust => (percentageWeightLoss < 5)
      ? 0
      : (percentageWeightLoss >= 5 && percentageWeightLoss <= 10)
      ? 1
      : 2;
  int get acuteDiseaseEffectMust => isCheckedIll && isCheckedNoNutrition ? 2 : 0;

  int get mustScore => bmiMust + unplannedMust + acuteDiseaseEffectMust;
}
