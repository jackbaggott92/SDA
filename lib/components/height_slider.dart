import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/generic_slider.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({super.key});

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  TextEditingController heightController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Column(
      children: [
        Text(
          'Height',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        GenericSlider(
          title: provider.displayHeight,
          onTitleTap: () => provider.cycleHeightUnit(),
          onTextChanged: (newHeight) => provider.setCm(
            double.tryParse(newHeight)?.clamp(0, 250).toInt() ?? 0,
          ),
          textFieldHintText: 'Enter height in cm',
          controller: heightController,
          min: 0,
          max: 250,
          divisions: 250,
          sliderValue: provider.cm.toDouble(),
          onSliderChanged: (newCm) => provider.setCm(newCm.toInt()),
          onLongPressDecrement: () => provider.startDecrementingCm(),
          onLongPressIncrement: () => provider.startIncrementingCm(),
          onLongPressDecrementUp: () => provider.stopDecrementingCm(),
          onLongPressIncrementUp: () => provider.stopIncrementingCm(),
          onDecrement: () => provider.decrementCm(),
          onIncrement: () => provider.incrementCm(),
          onChanged: (heightCm) => provider.setCm(int.tryParse(heightCm) ?? 0),
        ),
      ],
    );
  }
}
