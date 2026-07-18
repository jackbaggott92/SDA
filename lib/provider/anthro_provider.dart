import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Cards/Deficit_card.dart';
import 'package:studenttoolboxv3/components/Cards/Estimated_requirements_card.dart';
import 'package:studenttoolboxv3/components/Cards/estimated_intake.dart';
import 'package:studenttoolboxv3/components/Cards/height_and_weight_card.dart';
import 'package:studenttoolboxv3/components/Cards/weight_change_card.dart';
import 'package:studenttoolboxv3/models/cardListTile_model.dart';
import 'package:studenttoolboxv3/models/food_model.dart';

enum Gender { male, female }

enum Height { cm, ft }

enum Weight { kg, lb, st }

class AnthroProvider extends ChangeNotifier {
  void clearAll() {
    clearCalories();
    clearHeight();
    clearMust();
    clearPal();
    clearPatientIntake();
    clearPreviousWeight();
    clearProtein();
    clearWeight();
    notifyListeners();
  }

  //----------------------------Age-------------------------//

  int _age = 18;
  int get age => _age;

  bool _isDecrementingAge = false;
  bool _isIncrementingAge = false;

  void clearAge() {
    _age = 18;
    notifyListeners();
  }

  void setAge(int newAge) {
    if (newAge > 18 && newAge <121) {
      _age = newAge;
    } else {
      return;
    }
    notifyListeners();
    print(_age);
  }

  void incrementAge() {
    if (_age < 120) {
      _age++;
      notifyListeners();
    }
  }

  void decrementAge() {
    if (_age > 18) {
      _age--;
      notifyListeners();
    }
  }

  void startIncrementingAge() async {
    _isIncrementingAge = true;
    while (_isIncrementingAge) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (_age < 120) {
        _age++;
        notifyListeners();
      } else {
        break;
      }
    }
  }

  void stopIncrementingAge() {
    _isIncrementingAge = false;
  }

  void startDecrementingAge() async {
    _isDecrementingAge = true;
    while (_isDecrementingAge) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (_age > 18) {
        _age--;
        notifyListeners();
      } else {
        break;
      }
    }
  }
  
  void stopDecrementingAge(){
    _isDecrementingAge = false;
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

  void clearHeight() {
    _cm = 0;
    notifyListeners();
  }

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

  int get totalLb => (_kg * 2.204623).round();

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

  void clearWeight() {
    _kg = 0;
    notifyListeners();
  }

  void setWeight(double newWeight) {
    _kg = double.parse(newWeight.clamp(0, 200).toStringAsFixed(1));
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
      _kg = double.parse((_kg + stepSize).toStringAsFixed(1));
    }

    notifyListeners();
  }

  bool _isIncrementing = false;

  void startIncrementingWeight() async {
    _isIncrementing = true;
    while (_isIncrementing) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_kg < 200) {
        _kg = double.parse((_kg + stepSize).toStringAsFixed(1));
        notifyListeners();
      }
    }
  }

  void stopIncrementingWeight() {
    _isIncrementing = false;
  }

  void decrementWeight() {
    _kg = double.parse(((_kg - stepSize).clamp(0, 200)).toStringAsFixed(1));
    notifyListeners();
  }

  bool _isDecrementing = false;

  void startDecrementingWeight() async {
    _isDecrementing = true;
    while (_isDecrementing) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_kg > 0) {
        _kg = double.parse(((_kg - stepSize).clamp(0, 200)).toStringAsFixed(1));
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

  int get totalPreviousLb => (_previousKg * 2.204623).round();
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

  void clearPreviousWeight() {
    _previousKg = 0;
    notifyListeners();
  }

  void setPreviousWeight(double newPreviousWeight) {
    _previousKg = double.parse(
      newPreviousWeight.clamp(0, 200).toStringAsFixed(1),
    );
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
      _previousKg = double.parse(
        (_previousKg + previousStepSize).toStringAsFixed(1),
      );
    }
    notifyListeners();
  }

  bool _isIncrementingPrevious = false;

  void startIncrementingPreviousWeight() async {
    _isIncrementingPrevious = true;
    while (_isIncrementingPrevious) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_previousKg < 200) {
        _previousKg = double.parse(
          (_previousKg + previousStepSize).toStringAsFixed(1),
        );
        notifyListeners();
      }
    }
  }

  void stopIncrementingPreviousWeight() {
    _isIncrementingPrevious = false;
  }

  void decrementPreviousWeight() {
    _previousKg = double.parse(
      ((_previousKg - previousStepSize).clamp(0, 200)).toStringAsFixed(1),
    );
    notifyListeners();
  }

  bool _isDecrementingPrevious = false;

  void startDecrementingPreviousWeight() async {
    _isDecrementingPrevious = true;
    while (_isDecrementingPrevious) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_previousKg > 0) {
        _previousKg = double.parse(
          ((_previousKg - previousStepSize).clamp(0, 200)).toStringAsFixed(1),
        );
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
  double get percentageWeightChange => ((weightChange / previousKg) * 100); 

  //-------------------------bmi---------------------------------

  double get bmi => kg / ((_cm / 100) * (_cm / 100));


  //------------------------------------------------------
  //--------------------------pal--------------------------

  double pal = 1;
  String get displayPal {
    if (pal >= 1 && pal <= 1.1) {
      return 'In bed and immobile: Acute illness/injury/post-surgery';
    } else if (pal > 1.1 && pal <= 1.2) {
      return 'In bed and/or sitting out: Hospital ward/Care home/home';
    } else if (pal > 1.2 && pal <= 1.25) {
      return 'Limited mobility: Hospital ward/Care home w/ FT care';
    } else if (pal > 1.25 && pal <= 1.4) {
      return 'Sedentarty: Care home or at home';
    } else {
      return 'Unknown';
    }
  }

  void clearPal() {
    pal = 1;
    notifyListeners();
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
  int currentCalories = 0;//changed to int

  int get mifflinMale => (((10*_kg)+(6.25*_cm)-(5*_age)+5)*pal).round(); 
  int get mifflinFemale =>(((10*_kg)+(6.25*_cm)-(5*_age)-161)*pal).round();

  int get lowerCalorieRange => (_kg * pal * calories).round();//changed from double to int and round
  int get upperCalorieRange { //changed from double to int and round
    final upper = (_kg * pal * upperCalories).round();//added round
    final lower = lowerCalorieRange;

    return upper < lower ? lower : upper;
  }

  int get safeCurrentCalories =>
      currentCalories.clamp(lowerCalorieRange, upperCalorieRange);

  bool isMifflin = false;

  void clearCalories() {
    calories = 0;
    upperCalories = 0;
    currentCalories = 0;
    isMifflin = false;
    notifyListeners();
  }

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
    currentCalories = newCurrent.round();
    notifyListeners();
    print(currentCalories);
  }

  void setMifflin(){
    isMifflin = !isMifflin;
    notifyListeners();
  }

  

  //----------------------------------------------------------------------------
  //----------------------------------Protein-------------------------------------

  double lowerProtein = 0;
  double upperProtein = 0;
  int currentProtein = 0;

  bool minus25Percent = false;
  bool minus35Percent = false;

  int get lowerProteinRange => ((minus25Percent == true) ? (lowerProtein * _kg)*0.75 : (minus35Percent==true) ? (lowerProtein*_kg)*0.65 : lowerProtein*_kg).round();
  int get upperProteinRange {
  int lower = lowerProteinRange;

  int upper = ((minus25Percent)
      ? (upperProtein * _kg) * 0.75
      : (minus35Percent)
          ? (upperProtein * _kg) * 0.65
          : upperProtein * _kg).round();

  return upper < lower ? lower : upper;
}
  
  int get safeCurrentProtein =>
      currentProtein.clamp(lowerProteinRange, upperProteinRange);

  int get currentProteinKcal => safeCurrentProtein * 4;



  void setMinus25Percent(){
    minus25Percent = !minus25Percent;
    minus35Percent = false;
    notifyListeners();
  }

  void setMinus35Percent(){
    minus35Percent = !minus35Percent;
    minus25Percent=false;
    notifyListeners();
  }

  void clearProtein() {
    lowerProtein = 0;
    upperProtein = 0;
    currentProtein = 0;
    minus25Percent = false;
    minus35Percent = false;
    
    notifyListeners();
  }

  void setLowerProtein(double newProtein) {
    lowerProtein = newProtein;
    currentProtein = safeCurrentProtein.clamp(lowerProteinRange, upperProteinRange);
    notifyListeners();
    print(lowerProtein);
  }

  void setUpperProtein(double newProtein) {
    upperProtein = newProtein;
    currentProtein = safeCurrentProtein.clamp(lowerProteinRange, upperProteinRange);
    notifyListeners();
    print(upperProtein);
  }

  void setCurrentProtein(double newCurrent) {
    currentProtein = newCurrent.round();
    notifyListeners();
    print(currentProtein);
  }

  //-----------------------------------------------------------------------
  //------------------------------fluid-----------------------------------

  int get fluidRecomendation => (_age > 59) ? 30 : 35;
  int get fluidRequirement => (fluidRecomendation * _kg).round();

  //------------------------------------------------------------------
  //------------------------------MUST---------------------------------

  bool isCheckedIll = false;
  bool isCheckedNoNutrition = false;

  void clearMust() {
    isCheckedIll = false;
    isCheckedNoNutrition = false;
    notifyListeners();
  }

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
  int get acuteDiseaseEffectMust =>
      isCheckedIll && isCheckedNoNutrition ? 2 : 0;

  int get mustScore => bmiMust + unplannedMust + acuteDiseaseEffectMust;

  //-----------------------------------------------------------------------//
  //--------------------------estimated food intake-----------------------//

  List<FoodModel> hospitalBreakfast = [
    FoodModel(name: 'Cereal', fullCalories: 250, fullProtein: 10),
    FoodModel(name: 'Porridge/Read Brek', fullCalories: 400, fullProtein: 15),
    FoodModel(name: 'Toast', fullCalories: 150, fullProtein: 3),
  ];

  List<FoodModel> hospitalMeals = [
    FoodModel(name: 'Soup', fullCalories: 200, fullProtein: 8),
    FoodModel(name: 'S/W', fullCalories: 300, fullProtein: 15),
    FoodModel(name: 'Lunch Main', fullCalories: 500, fullProtein: 20),
    FoodModel(name: 'Evening Main', fullCalories: 500, fullProtein: 20),
    FoodModel(name: 'Hot Pudding', fullCalories: 300, fullProtein: 8),
    FoodModel(name: 'Ice Cream', fullCalories: 150, fullProtein: 3),
  ];

  List<FoodModel> hospitalDrinks = [
    FoodModel(name: 'Whole milk (~300ml)', fullCalories: 200, fullProtein: 5),
    FoodModel(name: 'Tea/Coffe with milk', fullCalories: 20, fullProtein: 0),
    FoodModel(name: 'Juice', fullCalories: 40, fullProtein: 0),
  ];

  List<FoodModel> hospitalSnacks = [
    FoodModel(name: 'Yoghurt', fullCalories: 120, fullProtein: 5),
    FoodModel(name: 'Cake', fullCalories: 200, fullProtein: 2),
    FoodModel(name: 'Cheese & Crackers', fullCalories: 15, fullProtein: 6),
    FoodModel(name: 'Crisps', fullCalories: 130, fullProtein: 0),
  ];

  List<FoodModel> hospitalONS = [
    FoodModel(
      name: 'Ensure Compact',
      fullCalories: 300,
      fullProtein: 12.8,
      volume: 125,
      iddsi: 2,
    ),
    FoodModel(
      name: 'Ensure Plus Juce',
      fullCalories: 330,
      fullProtein: 10.6,
      volume: 220,
      iddsi: 1,
    ),
    FoodModel(
      name: 'Ensure Plus MS',
      fullCalories: 300,
      fullProtein: 12.5,
      volume: 200,
      iddsi: 0,
    ),
    FoodModel(
      name: 'Ensure Plus Advance',
      fullCalories: 330,
      fullProtein: 20,
      volume: 220,
      iddsi: 1,
    ),
    FoodModel(
      name: 'ActaSolve Smoothie',
      fullCalories: 300,
      fullProtein: 10.7,
      volume: 150,
      iddsi: 2,
    ),
    FoodModel(
      name: 'Ensure TwoCal',
      fullCalories: 400,
      fullProtein: 16.8,
      volume: 200,
      iddsi: 1,
    ),
    FoodModel(
      name: 'Fresubin Thick L2',
      fullCalories: 300,
      fullProtein: 20,
      volume: 200,
      iddsi: 2,
    ),
    FoodModel(
      name: 'Fresubin Thick L3',
      fullCalories: 300,
      fullProtein: 20,
      volume: 200,
      iddsi: 3,
    ),
    FoodModel(
      name: 'ProSource Plus',
      fullCalories: 100,
      fullProtein: 15,
      volume: 30,
    ),
    FoodModel(
      name: 'Pro-Cal shot',
      fullCalories: 100,
      fullProtein: 2,
      volume: 30,
      iddsi: 3,
    ),
  ];

  List<FoodModel> patientIntake = [];

  int get totalCalories =>
      patientIntake.fold(0, (sum, food) => sum + food.fullCalories);
  double get totalProtein =>
      patientIntake.fold(0, (sum, food) => sum + food.fullProtein);

  void clearPatientIntake() {
    patientIntake = [];
    notifyListeners();
  }

  void addPatientFood(FoodModel food) {
    final newPatientIntake = [...patientIntake, food];
    patientIntake = newPatientIntake;
    notifyListeners();
  }

  void deletePatientFood(int index) {
    final newPatientIntake = [...patientIntake];
    newPatientIntake.removeAt(index);
    patientIntake = newPatientIntake;
    notifyListeners();
  }

//-----------------------------------------------------------------------------------------------//
//--------------------------------Card List------------------------------------------------//

  List<CardlisttileModel> availableCardList = [
CardlisttileModel(name: 'Height and Weight', card: HeightAndWeightCard()),
CardlisttileModel(name: 'MUST Tool', card: WeightChangeCard()),
CardlisttileModel(name: 'Estimated Requirements', card: EstimatedRequirementsCard()),
CardlisttileModel(name: 'Estimated Intake', card: EstimatedIntakeCard()),
CardlisttileModel(name: 'Deficit', card: DeficitCard())
  ];

  List<Widget> activeCardList = [

  ];

void addCardToActiveCardList(Widget card){
  final newActiveCardList = [...activeCardList, card];
  activeCardList = newActiveCardList;
  notifyListeners();
}

void clearCardList(){
  activeCardList = [];
  notifyListeners();
}

void removeCard(int index){
  final newActiveCardList = [... activeCardList];
  newActiveCardList.removeAt(index);
  activeCardList = newActiveCardList;
  notifyListeners();
}

bool isCardActive(Widget card) {
  return activeCardList.contains(card);
}

void removeCardWidget(Widget card) {
  activeCardList.remove(card);
  notifyListeners();
}
}

