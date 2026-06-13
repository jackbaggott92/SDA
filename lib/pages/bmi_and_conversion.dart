import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/bmi_slider.dart';
import 'package:studenttoolboxv3/components/generic_slider.dart';
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
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('BMI: kg / ((cm / 100) * (cm / 100))'),
                    Text('      = ${provider.kg}kg / (${(provider.cm / 100)})m * (${(provider.cm / 100)})m'),
                    Text('      = ${provider.bmi}kg/m2')
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
            onChanged: (heightCm) =>
                provider.setCm(int.tryParse(heightCm) ?? 0),
          ),
          Text(
            'Weight',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          GenericSlider(
            title: provider.displayWeight,
            onTitleTap: () => provider.cycleWeight(),
            controller: weightController,
            onTextChanged: (newWeight) => provider.setWeight(
              double.tryParse(newWeight)?.clamp(0, 200) ?? 0,
            ),
            textFieldHintText: 'Enter weight in kg',
            min: 0,
            max: 200,
            divisions: 2000,
            sliderValue: provider.kg,
            onSliderChanged: (newWeight) => provider.setWeight(newWeight),
            onLongPressDecrement: provider.startDecrementingWeight,
            onLongPressDecrementUp: provider.stopDecrementingWeight,
            onLongPressIncrement: provider.startIncrementingWeight,
            onLongPressIncrementUp: provider.stopIncrementingWeight,
            onDecrement: provider.decrementWeight,
            onIncrement: provider.incrementWeight,
            onChanged: (weight) =>
                provider.setWeight(double.tryParse(weight) ?? 0),
          ),
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
