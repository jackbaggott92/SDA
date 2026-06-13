import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class BmiSlider extends StatelessWidget {
  const BmiSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();

    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Stack(
        children: [
          // BMI Category Bar
          Positioned(
            left: 15,
            right: 15,
            bottom: 22,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  Expanded(flex: 90, child: Container(height: 25, color: Colors.red)),
                  Expanded(flex: 65, child: Container(height: 25, color: Colors.green)),
                  Expanded(flex: 50, child: Container(height: 25, color: Colors.orange)),
                  Expanded(flex: 105, child: Container(height: 25, color: Colors.red)),
                ],
              ),
            ),
          ),

          // Slider on top
          Positioned.fill(
            child: Slider(
              min: 10,
              max: 40,
              value: provider.bmi.clamp(10, 40),
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}