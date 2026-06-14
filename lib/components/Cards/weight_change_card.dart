import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_generic_slider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_height_slider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_weight_slider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class WeightChangeCard extends StatefulWidget {
  const WeightChangeCard({super.key});

  @override
  State<WeightChangeCard> createState() => _WeightChangeCardState();
}

class _WeightChangeCardState extends State<WeightChangeCard> {
  TextEditingController previousWeightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return ExpansionTile(
      title: Text(
        'Weight Change and MUST',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '${provider.previousKg}kg ----> ${(provider.kg).toStringAsFixed(1)}, (${(provider.weightChange).toStringAsFixed(1)}kg, ${(provider.percentageWeightChange).toStringAsFixed(1)}%)\nMUST Score: ${provider.mustScore}',
      ),
      children: [
        Column(
          children: [
            CompactHeightSlider(),
            CompactWeightSlider(),
            CompactGenericSlider(
              title: provider.displayPreviousWeight,
              sliderTitle: 'Previous Weight',
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
              onLongPressDecrementUp: provider.stopDecrementingPreviousWeight,
              onLongPressIncrement: provider.startIncrementingPreviousWeight,
              onLongPressIncrementUp: provider.stopIncrementingPreviousWeight,
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
                Text('Is patient acutely ill'),
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
          ],
        ),
      ],
    );
  }
}
