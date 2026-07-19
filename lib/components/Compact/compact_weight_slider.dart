import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_generic_slider.dart';


class CompactWeightSlider extends StatefulWidget {
  const CompactWeightSlider({super.key});

  @override
  State<CompactWeightSlider> createState() => _CompactWeightSliderState();
}

class _CompactWeightSliderState extends State<CompactWeightSlider> {
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Column(
      children: [

          CompactGenericSlider(
            sliderTitle: 'Current Weight:',
            title: provider.displayWeight,
            onTitleTap: () => provider.cycleWeight(),
            controller: weightController,
            onTextChanged: (newWeight) => provider.setWeight(
              double.tryParse(newWeight)?.clamp(0, 200) ?? 0,
            ),
            textFieldHintText: 'Enter current weight',
            min: 0,
            max: 200,
            sliderValue: provider.currentkg,
            onSliderChanged: (newWeight) => provider.setWeight(newWeight),
            onLongPressDecrement: provider.startDecrementingWeight,
            onLongPressDecrementUp: provider.stopDecrementingWeight,
            onLongPressIncrement: provider.startIncrementingWeight,
            onLongPressIncrementUp: provider.stopIncrementingWeight,
            onDecrement: provider.decrementWeight,
            onIncrement: provider.incrementWeight,
            onChanged: (weight) =>
                provider.setWeight(double.tryParse(weight) ?? 0),
          ),
      ],
    );
  }
}