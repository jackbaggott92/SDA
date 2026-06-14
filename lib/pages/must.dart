import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/height_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/weight_slider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:provider/provider.dart';

class WeightChangePage extends StatefulWidget {
  const WeightChangePage({super.key});

  @override
  State<WeightChangePage> createState() => _WeightChangePageState();
}

class _WeightChangePageState extends State<WeightChangePage> {
  TextEditingController previousWeightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('MUST Calculator'),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weight Change = ${provider.kg}kg - ${provider.previousKg}kg',
                    ),
                    Text('= ${provider.weightChange.toStringAsFixed(1)}kg'),
                    Text(''),
                    Text('% change = ((Weight Change / Previous Weight)*100))'),
                    Text(
                      '= ${provider.weightChange.toStringAsFixed(1)}kg / ${provider.previousKg}kg * 100',
                    ),
                    Text(
                      '= ${(provider.weightChange / provider.previousKg) * 100}%',
                    ),
                  ],
                ),
              ),
            ),
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeightSlider(),
          WeightSlider(),
          Text(
            'Previous Weight',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          GenericSlider(
            title: provider.displayPreviousWeight,
            onTitleTap: () => provider.cyclePreviousWeight(),
            textFieldHintText: 'Previous weight in Kg',
            controller: previousWeightController,
            onTextChanged: (newPreviousWeight) => provider.setPreviousWeight(
              double.tryParse(newPreviousWeight)?.clamp(0, 200) ?? 0,
            ),
            min: 0,
            max: 200,
            sliderValue: provider.previousKg,
            onSliderChanged: (newPreviousWeight) =>
                provider.setPreviousWeight(newPreviousWeight),
            onLongPressDecrement: provider.startDecrementingPreviousWeight,
            onLongPressDecrementRelease:
                provider.stopDecrementingPreviousWeight,
            onLongPressIncrement: provider.startIncrementingPreviousWeight,
            onLongPressIncrementRelease:
                provider.stopIncrementingPreviousWeight,
            onDecrement: provider.decrementPreviousWeight,
            onIncrement: provider.incrementPreviousWeight,
            onChanged: (previousWeight) => provider.setPreviousWeight(
              double.tryParse(previousWeight) ?? 0,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text('Is acutely ill'),
                Checkbox(
                  value: provider.isCheckedIll,
                  onChanged: (bool? value) {
                    provider.setIsCheckedIll(value ?? false);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text('Likely no nutritional intake for >5 days'),
                Checkbox(
                  value: provider.isCheckedNoNutrition,
                  onChanged: (bool? value) {
                    provider.setIsCheckedNoNutrition(value ?? false);
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text('MUST: ${provider.mustScore}'),
              Text('BMI: ${(provider.bmi)}(${(provider.bmiMust)})'),
              Text(
                '%Weightchange: ${(provider.percentageWeightChange).toStringAsFixed(1)}% (${provider.unplannedMust})',
              ),
              Text(
                'Acute Disease Effect Score: ${provider.acuteDiseaseEffectMust}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
