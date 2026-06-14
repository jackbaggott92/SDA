import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class ProteinSlider extends StatefulWidget {
  const ProteinSlider({super.key});

  @override
  State<ProteinSlider> createState() => _ProteinSliderState();
}

class _ProteinSliderState extends State<ProteinSlider> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return SizedBox(
      child: Column(
        children: [
          Text('Protein Range: ${provider.currentProtein.toStringAsFixed(0)}g'),
          Row(
            children: [
              Column(
                children: [
                  Text(provider.upperProteinRange.toStringAsFixed(0)),
                  SizedBox(height: 120),
                  Text(provider.lowerProteinRange.toStringAsFixed(0)),
                ],
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  activeColor: Colors.blue,
                  min: provider.lowerProteinRange.toDouble(),
                  max: provider.upperProteinRange.toDouble(),
                  value: provider.safeCurrentProtein,
                  onChanged: (value) => provider.setCurrentProtein(value),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
