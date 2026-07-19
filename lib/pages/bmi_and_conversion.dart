import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Fullsize/bmi_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/height_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/weight_slider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class BmiAndConversionPage extends StatefulWidget {
  const BmiAndConversionPage({super.key});

  @override
  State<BmiAndConversionPage> createState() => _BmiAndConversionPageState();
}

class _BmiAndConversionPageState extends State<BmiAndConversionPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController calories = TextEditingController();
  TextEditingController caloriesUpper = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI and Conversion'),
        actions: [
          IconButton(onPressed: () {provider.clearHeight(); provider.clearWeight();}, icon: Icon(Icons.refresh)),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('ONLY WORKING ON CURRENT WEIGHT NOT ACTUAL WEIGHT', style: TextStyle(fontSize: 20),),
                    Text('BMI: kg / ((cm / 100) * (cm / 100))'),
                    Text(
                      '      = ${provider.currentkg}kg / (${(provider.cm / 100)})m * (${(provider.cm / 100)})m',
                    ),
                    Text('      = ${provider.bmi}kg/m2'),
                  ],
                ),
              ),
            ),
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeightSlider(),
          WeightSlider(),
          Text(
            'BMI',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            '${provider.bmi.toStringAsFixed(1)} kg/m2',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          BmiSlider(),
        ],
      ),
    );
  }
}
