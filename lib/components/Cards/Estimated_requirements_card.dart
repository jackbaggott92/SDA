import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_weight_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_textfield.dart';
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
    return ExpansionTile(
      backgroundColor: const Color.fromARGB(255, 188, 192, 255),
      title: Text(
        'Estimated Requirements',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text('Calorie Range: ${provider.lowerCalorieRange.toStringAsFixed(0)}-${provider.upperCalorieRange.toStringAsFixed(0)} kcal\nProtein Range: ${provider.lowerProteinRange.toStringAsFixed(0)}-${provider.upperProteinRange.toStringAsFixed(0)} g\nFluid(60/60+): ${(provider.kg * 35).toStringAsFixed(0)}/${(provider.kg * 30).toStringAsFixed(0)}ml '),

      children: [
        Column(
          children: [
            CompactWeightSlider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color.fromARGB(255, 218, 212, 255),
                width: double.infinity,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Calorie Range: ${provider.lowerCalorieRange.toStringAsFixed(0)}-${provider.upperCalorieRange.toStringAsFixed(0)} kcal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: GenericTextfield(
                              width: 200,
                              hintText: 'Lower Calories',
                              controller: lowerCaloriesController,
                              onChanged: (lowerCals) => provider.setCalories(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                      child: Text(
                        'Protein Range: ${provider.lowerProteinRange.toStringAsFixed(0)}-${provider.upperProteinRange.toStringAsFixed(0)} g',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8),
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
                              padding: const EdgeInsets.only(left: 8.0, right: 8),
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
                  ],
                ),
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}
