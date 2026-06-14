import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/fullsize/bmi_slider.dart';
import 'package:studenttoolboxv3/components/compact/compact_height_slider.dart';
import 'package:studenttoolboxv3/components/compact/compact_weight_slider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:provider/provider.dart';

class CardStream extends StatefulWidget {
  const CardStream({super.key});

  @override
  State<CardStream> createState() => _CardStreamState();
}

class _CardStreamState extends State<CardStream> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Column(
        children: [
          ExpansionTile(
            title: Text('Weight and Height'),
            subtitle: Text(
              '${(provider.cm).toStringAsFixed(0)} cm, ${(provider.kg).toStringAsFixed(1)}kg, BMI: ${(provider.bmi).toStringAsFixed(2)}',
            ),
            children: [
              Column(
                children: [
                  CompactHeightSlider(),
                  CompactWeightSlider(),
                  Text('BMI: ${(provider.bmi).toStringAsFixed(2)}'),
                  BmiSlider(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
