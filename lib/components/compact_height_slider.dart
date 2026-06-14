import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:studenttoolboxv3/components/compact_generic_slider.dart';

class CompactHeightSlider extends StatefulWidget {
  const CompactHeightSlider({super.key});

  @override
  State<CompactHeightSlider> createState() => _CompactHeightSliderState();
}

class _CompactHeightSliderState extends State<CompactHeightSlider> {
  TextEditingController heightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Column(
      children: [
        CompactGenericSlider(
          sliderTitle: 'Current Height:',
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
