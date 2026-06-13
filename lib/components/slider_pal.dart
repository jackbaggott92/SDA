import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:provider/provider.dart';

class SliderPal extends StatefulWidget {
  const SliderPal({super.key});

  @override
  State<SliderPal> createState() => _SliderPalState();
}

class _SliderPalState extends State<SliderPal> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return SizedBox(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text('PAL: ${provider.pal}'),
          ),
          Slider(
            divisions: 40,
            min: 1,
            max: 1.4,
            value: provider.pal,
            onChanged: (value) {
              provider.setPal(value);
              provider.setCurrentCalories(provider.lowerCalorieRange);
            },
          ),
        ],
      ),
    );
  }
}
