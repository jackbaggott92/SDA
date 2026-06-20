import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Cards/Estimated_requirements_card.dart';
import 'package:studenttoolboxv3/components/Cards/deficit.dart';
import 'package:studenttoolboxv3/components/Cards/estimated_intake.dart';
import 'package:studenttoolboxv3/components/Cards/height_and_weight_card.dart';
import 'package:studenttoolboxv3/components/Cards/weight_change_card.dart';

class CardStream extends StatefulWidget {
  const CardStream({super.key});

  @override
  State<CardStream> createState() => _CardStreamState();
}

class _CardStreamState extends State<CardStream> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(actions: []),
      body: SingleChildScrollView(
        child: Column(
          children: [
                    HeightAndWeightCard(),
                    WeightChangeCard(),
                    EstimatedRequirementsCard(),
                    EstimatedIntake(),
                    Deficit()


          ],
        ),
      ),
    );
  }
}
