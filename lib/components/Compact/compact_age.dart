import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_generic_slider.dart';

class CompactAge extends StatefulWidget {
  const CompactAge({super.key});

  @override
  State<CompactAge> createState() => _CompactAgeState();
}

class _CompactAgeState extends State<CompactAge> {
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Column(
      children: [
        CompactGenericSlider(
          sliderTitle: 'Age:',
          title: '${provider.age.toString()} yo                  ',
          onTextChanged: (newAge) =>provider.setAge(double.tryParse(newAge)?.clamp(18,120).toInt()??18) ,
          textFieldHintText: 'Enter age in years  ',
          controller: ageController,
          divisions: 102,
          min: 18,
          max: 120,
          sliderValue: provider.age.toDouble(),
          onSliderChanged: (newAge) => provider.setAge(newAge.toInt()),
          onLongPressDecrement: () => provider.startDecrementingAge(),
          onLongPressIncrement: () => provider.startIncrementingAge(),
          onLongPressDecrementUp: () => provider.stopDecrementingAge(),
          onLongPressIncrementUp: () => provider.stopIncrementingAge(),
          onDecrement: () => provider.decrementAge(),
          onIncrement: () => provider.incrementAge(),
          onChanged: (age) => provider.setAge(int.tryParse(age) ?? 18),
        ),
      ],
    );
  }
}
