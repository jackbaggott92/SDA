import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:studenttoolboxv3/components/generic_slider.dart';

class WeightSlider extends StatefulWidget {
  const WeightSlider({super.key});

  @override
  State<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Column(
      children: [
                  Text(
            'Current Weight',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          GenericSlider(
            title: provider.displayWeight,
            onTitleTap: () => provider.cycleWeight(),
            controller: weightController,
            onTextChanged: (newWeight) => provider.setWeight(
              double.tryParse(newWeight)?.clamp(0, 200) ?? 0,
            ),
            textFieldHintText: 'Enter current weight',
            min: 0,
            max: 200,
            sliderValue: provider.kg,
            onSliderChanged: (newWeight) => provider.setWeight(newWeight),
            onLongPressDecrement: provider.startDecrementingWeight,
            onLongPressDecrementRelease: provider.stopDecrementingWeight,
            onLongPressIncrement: provider.startIncrementingWeight,
            onLongPressIncrementRelease: provider.stopIncrementingWeight,
            onDecrement: provider.decrementWeight,
            onIncrement: provider.incrementWeight,
            onChanged: (weight) =>
                provider.setWeight(double.tryParse(weight) ?? 0),
          ),
      ],
    );
  }
}