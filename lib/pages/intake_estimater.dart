import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Fullsize/hospital_food.dart';
import 'package:studenttoolboxv3/components/Fullsize/hospital_food_eaten.dart';
import 'package:studenttoolboxv3/components/Fullsize/weight_slider.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:studenttoolboxv3/components/generic_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_textfield.dart';

class IntakeEstimater extends StatefulWidget {
  const IntakeEstimater({super.key});

  @override
  State<IntakeEstimater> createState() => _IntakeEstimaterState();
}

class _IntakeEstimaterState extends State<IntakeEstimater> {
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
      appBar: AppBar(actions: [IconButton(onPressed: provider.clearPatientIntake, icon: Icon(Icons.refresh))]),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ExpansionTile(
            title: const Text('Menu'),
            children: [
              ExpansionTile(
                title: Text('Breakfast'),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.hospitalBreakfast.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: HospitalFood(
                          index: index,
                          food: provider.hospitalBreakfast[index],
                          onAdd: () {
                            provider.addPatientFood(
                              provider.hospitalBreakfast[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Lunch'),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.hospitalMeals.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: HospitalFood(
                          index: index,
                          food: provider.hospitalMeals[index],
                          onAdd: () {
                            provider.addPatientFood(
                              provider.hospitalMeals[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Tea'),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.hospitalMeals.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: HospitalFood(
                          index: index,
                          food: provider.hospitalMeals[index],
                          onAdd: () {
                            provider.addPatientFood(
                              provider.hospitalMeals[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Snacks'),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.hospitalSnacks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: HospitalFood(
                          index: index,
                          food: provider.hospitalSnacks[index],
                          onAdd: () {
                            provider.addPatientFood(
                              provider.hospitalSnacks[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Drinks'),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.hospitalDrinks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: HospitalFood(
                          index: index,
                          food: provider.hospitalDrinks[index],
                          onAdd: () {
                            provider.addPatientFood(
                              provider.hospitalDrinks[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('ONS'),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.hospitalONS.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: HospitalFood(
                          index: index,
                          food: provider.hospitalONS[index],
                          onAdd: () {
                            provider.addPatientFood(
                              provider.hospitalONS[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          ExpansionTile(
            title: Text('Intake'),
            subtitle: Row(
              children: [
                Text(
                  'Calories: ${(provider.totalCalories).toStringAsFixed(0)}kcal, ',
                ),
                Text('Protein: ${(provider.totalProtein).toStringAsFixed(0)}g'),
              ],
            ),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.patientIntake.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: HospitalFoodEaten(
                    index: index,
                    food: provider.patientIntake[index],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Deficit'),
            subtitle: Row(
              children: [
                Text(
                  'Calories: ${(provider.lowerCalorieRange - provider.totalCalories).toStringAsFixed(0)}-${(provider.upperCalorieRange - provider.totalCalories).toStringAsFixed(0)} Kcal, ',
                ),
                Text(
                  'Protein: ${(provider.lowerProteinRange - provider.totalProtein).toStringAsFixed(0)}-${(provider.upperProteinRange - provider.totalProtein).toStringAsFixed(0)} g',
                ),
              ],
            ),
            children: [
              ExpansionTile(
                title: Text('Weight'),
                subtitle: Text('Weight: ${provider.kg.toStringAsFixed(1)}kg'),
                children: [WeightSlider()],
              ),
              ExpansionTile(
                title: Text('Calories Requirements'),
                subtitle: Row(
                  children: [
                    Text(
                      'Calorie Range: ${provider.lowerCalorieRange.toStringAsFixed(0)}-${provider.upperCalorieRange.toStringAsFixed(0)} kcal',
                    ),
                  ],
                ),
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
                            onChanged: (upperCals) => provider.setUpperCalories(
                              int.tryParse(upperCals) ?? 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Calorie Range: ${provider.lowerCalorieRange.toStringAsFixed(0)}-${provider.upperCalorieRange.toStringAsFixed(0)} kcal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  GenericSlider(
                    title:
                        '${provider.currentCalories.toStringAsFixed(0)} kcal',
                    textFieldHintText: 'Select caloires',
                    controller: selectedCalories,
                    min: provider.lowerCalorieRange.toDouble(),
                    max: provider.upperCalorieRange.toDouble(),
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
              ExpansionTile(
                title: Text('Protein Requirements'),
                subtitle: Row(
                  children: [
                    Text(
                      'Protein Range: ${provider.lowerProteinRange.toStringAsFixed(0)}-${provider.upperProteinRange.toStringAsFixed(0)} g',
                    ),
                  ],
                ),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
            ],
          ),
        ],
      ),
    );
  }
}
