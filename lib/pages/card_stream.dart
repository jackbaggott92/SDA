import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Cards/Estimated_requirements_card.dart';
import 'package:studenttoolboxv3/components/Cards/deficit.dart';
import 'package:studenttoolboxv3/components/Cards/estimated_intake.dart';
import 'package:studenttoolboxv3/components/Cards/height_and_weight_card.dart';
import 'package:studenttoolboxv3/components/Cards/weight_change_card.dart';
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
  appBar: AppBar(
    actions: [
      IconButton(
        onPressed: () {
          provider.clearAll();
        },
        icon: const Icon(Icons.refresh),
      ),
    ],
  ),
  body: SingleChildScrollView(
    child: Column(
      children: const [
        HeightAndWeightCard(),
        WeightChangeCard(),
        EstimatedRequirementsCard(),
        EstimatedIntake(),
        Deficit(),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    backgroundColor:  const Color.fromARGB(255, 75, 15, 131),
    onPressed: () {
      provider.clearAll();
    },
    child: const Icon(Icons.add),
  ),
);
  }
}
