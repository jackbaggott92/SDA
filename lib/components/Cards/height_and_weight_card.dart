import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_height_slider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_weight_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/bmi_slider.dart';
import 'package:studenttoolboxv3/pages/bmi_and_conversion.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class HeightAndWeightCard extends StatefulWidget {
  const HeightAndWeightCard({super.key});

  @override
  State<HeightAndWeightCard> createState() => _HeightAndWeightCardState();
}

class _HeightAndWeightCardState extends State<HeightAndWeightCard> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return GestureDetector(
      onLongPress: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => BmiAndConversionPage())),
      child: ExpansionTile(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Weight and Height',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '${(provider.cm).toStringAsFixed(0)} cm, ${(provider.kg).toStringAsFixed(1)}kg, BMI: ${(provider.bmi).toStringAsFixed(2)}kg/m2',
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
    );
  }
}
