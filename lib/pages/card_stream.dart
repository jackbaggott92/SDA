import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Cards/height_and_weight_card.dart';
import 'package:studenttoolboxv3/components/Cards/weight_change_card.dart';
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

    return Scaffold(
      appBar: AppBar(actions: []),
      body: SingleChildScrollView(
        child: Column(
          children: [
                    HeightAndWeightCard(),
                    WeightChangeCard(),
          ],
        ),
      ),
    );
  }
}
