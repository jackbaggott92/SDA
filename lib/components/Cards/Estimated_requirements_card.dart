import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_age.dart';
import 'package:studenttoolboxv3/components/Compact/compact_height_slider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_weight_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_textfield.dart';
import 'package:studenttoolboxv3/components/Fullsize/slider_pal.dart';
import 'package:studenttoolboxv3/pages/calories_calculator.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class EstimatedRequirementsCard extends StatefulWidget {
  const EstimatedRequirementsCard({super.key});

  @override
  State<EstimatedRequirementsCard> createState() =>
      _EstimatedRequirementsCardState();
}

class _EstimatedRequirementsCardState extends State<EstimatedRequirementsCard> {
  TextEditingController lowerCaloriesController = TextEditingController();
  TextEditingController upperCaloriesController = TextEditingController();

  TextEditingController lowerProteinController = TextEditingController();
  TextEditingController upperProteinController = TextEditingController();

  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return GestureDetector(
      onLongPress: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => CaloriesCalculator())),
      child: ExpansionTile(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Estimated Requirements',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: (provider.isMifflin == false)
            ? Text(
                'Calorie Range: ${provider.lowerCalorieRange.toStringAsFixed(0)}-${provider.upperCalorieRange.toStringAsFixed(0)} kcal\nProtein Range: ${provider.lowerProteinRange.toStringAsFixed(0)}-${provider.upperProteinRange.toStringAsFixed(0)} g\nFluid(60/60+): ${provider.fluidRequirement.toStringAsFixed(0)}ml ',
              )
            : Text(
                'MSJ Calories: ${(provider.gender == Gender.male) ? (provider.mifflinMale).toStringAsFixed(0) : (provider.mifflinFemale).toStringAsFixed(0)}kcal\nProtein Range: ${provider.lowerProteinRange.toStringAsFixed(0)}-${provider.upperProteinRange.toStringAsFixed(0)} g\nFluid(60/60+): ${(provider.actualKg * 35).toStringAsFixed(0)}/${(provider.actualKg * 30).toStringAsFixed(0)}ml ',
              ),

        children: [
          Column(
            children: [
              ExpansionTile(
                title: Text('Details'),
                subtitle: Text(
                  '${(provider.cm).toStringAsFixed(0)} cm, ${(provider.actualKg).toStringAsFixed(1)}kg, BMI: ${(provider.bmi).toStringAsFixed(2)}kg/m2, Age: ${provider.age}, PAL: ${provider.pal}',
                ),
                children: [
                  CompactHeightSlider(),
                  CompactWeightSlider(),
                  CompactAge(),

                ],
              ),
                  SliderPal(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: double.infinity,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: provider.isMifflin == false
                                ? Text(
                                    'Calorie Range: ${provider.lowerCalorieRange.toStringAsFixed(0)}-${provider.upperCalorieRange.toStringAsFixed(0)} kcal',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : Text(
                                    'Calories: ${(provider.gender == Gender.male ? provider.mifflinMale : provider.mifflinFemale).toStringAsFixed(0)} kcal',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                          IconButton(onPressed: null, icon: Icon(Icons.list)),
                        ],
                      ),
                      if (provider.isMifflin == false) ...[
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8,
                                ),
                                child: GenericTextfield(
                                  width: 200,
                                  hintText: 'Lower Calories',
                                  controller: lowerCaloriesController,
                                  onChanged: (lowerCals) =>
                                      provider.setCalories(
                                        int.tryParse(lowerCals) ?? 0,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                            ),
                          ],
                        ),
                      ] else ...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SegmentedButton<Gender>(
                              showSelectedIcon: false,
                              segments: [
                                ButtonSegment(
                                  value: Gender.male,
                                  label: Text('Male'),
                                ),
                                ButtonSegment(
                                  value: Gender.female,
                                  label: Text('Female'),
                                ),
                              ],
                              selected: {provider.gender},
                              onSelectionChanged: (newGender) =>
                                  provider.setGender(newGender.first),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                provider.gender == Gender.male
                                    ? 'Men: \n(10 x ${provider.actualKg}kg) + (6.25 x ${provider.cm}cm) - (5 x ${provider.age}yo) + 5 * ${provider.pal} PAL'
                                    : 'Women: \n(10 x ${provider.actualKg}kg) + (6.25 x ${provider.cm}cm) - (5 x ${provider.age}yo) - 161 * ${provider.pal} PAL',
                              ),
                            ),
                          ],
                        ),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Mifflin-st Jeor'),
                          Checkbox(
                            value: provider.isMifflin,
                            onChanged: (value) => provider.setMifflin(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Protein Range: ${provider.lowerProteinRange.toStringAsFixed(0)}-${provider.upperProteinRange.toStringAsFixed(0)} g',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(onPressed: null, icon: Icon(Icons.list)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8,
                                ),
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
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8,
                                ),
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
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('-25% (BMI>30)'),
                          Checkbox(
                            value: provider.minus25Percent,
                            onChanged: (value) => provider.setMinus25Percent(),
                          ),
                          Text('-35% (BMI>50)'),
                          Checkbox(
                            value: provider.minus35Percent,
                            onChanged: (value) => provider.setMinus35Percent(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
