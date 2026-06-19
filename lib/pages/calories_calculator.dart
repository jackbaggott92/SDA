import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_textfield.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Fullsize/hospital_food.dart';
import 'package:studenttoolboxv3/components/Fullsize/weight_slider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:studenttoolboxv3/components/Fullsize/slider_pal.dart';

class CaloriesCalculator extends StatefulWidget {
  const CaloriesCalculator({super.key});

  @override
  State<CaloriesCalculator> createState() => _CaloriesCalculatorState();
}

class _CaloriesCalculatorState extends State<CaloriesCalculator> {
  TextEditingController lowerCaloriesController = TextEditingController();
  TextEditingController upperCaloriesController = TextEditingController();

  TextEditingController lowerProteinController = TextEditingController();
  TextEditingController upperProteinController = TextEditingController();

  TextEditingController selectedCalories = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController proteinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WeightSlider(),
            SliderPal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color.fromARGB(255, 235, 227, 245),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GenericTextfield(
                              width: 200,
                              hintText: 'Lower Calories',
                              controller: lowerCaloriesController,
                              onChanged: (lowerCals) => provider.setCalories(
                                int.tryParse(lowerCals) ?? 0,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: GenericTextfield(
                              width: 200,
                              hintText: 'Upper Calories',
                              controller: upperCaloriesController,
                              onChanged: (upperCals) =>
                                  provider.setUpperCalories(
                                    int.tryParse(upperCals) ?? 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Calorie Range: ${provider.lowerCalorieRange.toStringAsFixed(0)}-${provider.upperCalorieRange.toStringAsFixed(0)} kcal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GenericSlider(
                      title:
                          '${provider.currentCalories.toStringAsFixed(0)} kcal',
                      textFieldHintText: 'Select caloires',
                      controller: selectedCalories,
                      min: provider.lowerCalorieRange,
                      max: provider.upperCalorieRange,
                      sliderValue: provider.safeCurrentCalories,
                      onSliderChanged: (newCurrent) =>
                          provider.setCurrentCalories(newCurrent),
                      onLongPressDecrement: null,
                      onLongPressIncrement: null,
                      onLongPressDecrementRelease: null,
                      onLongPressIncrementRelease: null,
                      onDecrement: null,
                      onIncrement: null,
                      onChanged: (newCurrent) => provider.setCurrentCalories(
                        double.tryParse(newCurrent) ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color.fromARGB(255, 226, 236, 255),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GenericTextfield(
                              width: 200,
                              hintText: 'Lower Protein',
                              controller: lowerProteinController,
                              onChanged: (lowerProtein) =>
                                  provider.setLowerProtein(
                                    double.tryParse(lowerProtein) ?? 0,
                                  ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: GenericTextfield(
                              width: 200,
                              hintText: 'Upper Protein',
                              controller: upperProteinController,
                              onChanged: (upperProtein) =>
                                  provider.setUpperProtein(
                                    double.tryParse(upperProtein) ?? 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Protein Range: ${provider.lowerProteinRange.toStringAsFixed(0)}-${provider.upperProteinRange.toStringAsFixed(0)} g',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GenericSlider(
                      title: '${provider.currentProtein.toStringAsFixed(0)} g',
                      textFieldHintText: 'Select Protein',
                      controller: proteinController,
                      min: provider.lowerProteinRange,
                      max: provider.upperProteinRange,
                      sliderValue: provider.safeCurrentProtein,
                      onSliderChanged: (newCurrent) =>
                          provider.setCurrentProtein(newCurrent),
                      onLongPressDecrement: null,
                      onLongPressIncrement: null,
                      onLongPressDecrementRelease: null,
                      onLongPressIncrementRelease: null,
                      onDecrement: null,
                      onIncrement: null,
                      onChanged: (newCurrent) => provider.setCurrentProtein(
                        double.tryParse(newCurrent) ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('Fluid: >60 yo ${(provider.kg * 30).toStringAsFixed(0)}ml'),
            Text('Fluid: <60 yo ${(provider.kg * 35).toStringAsFixed(0)}ml'),
       
          ],
        ),
      ),
    );
  }
}
