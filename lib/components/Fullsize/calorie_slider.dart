import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class CalorieSlider extends StatefulWidget {
  const CalorieSlider({super.key});

  @override
  State<CalorieSlider> createState() => _CalorieSliderState();
}

class _CalorieSliderState extends State<CalorieSlider> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return SizedBox(
      child: Column(
        children: [
          Text('Calorie Range: ${provider.currentCalories.toStringAsFixed(0)}kcal'),
          Row(
            children: [
              Column(
                children: [
                  Text(provider.upperCalorieRange.toStringAsFixed(0)),
                  SizedBox(height: 120),

                  Text(provider.lowerCalorieRange.toStringAsFixed(0)),
                ],
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  activeColor: Colors.amber,
                  min: provider.lowerCalorieRange.toDouble(),
                  max: provider.upperCalorieRange.toDouble(),
                  value: provider.safeCurrentCalories.toDouble(),//changed toDouble
                  onChanged: (value) => provider.setCurrentCalories(value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
