import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/pages/bmi_and_conversion.dart';
import 'package:studenttoolboxv3/pages/card_stream.dart';
import 'package:studenttoolboxv3/pages/intake_estimater.dart';
import 'package:studenttoolboxv3/pages/must.dart';
import 'package:studenttoolboxv3/pages/calories_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), actions: []),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BmiAndConversionPage(),
                  ),
                ),
                child: Text('BMI and Conversion'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WeightChangePage()),
                ),
                child: Text('MUST'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CaloriesCalculator()),
                ),
                child: Text('Calories Calculator'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => CardStream())),
                child: Text('Card Stream'),
              ),
            ),
          ),
                    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => IntakeEstimater())),
                child: Text('Intake Estimater'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
