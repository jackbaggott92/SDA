import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_food_eaten.dart';
import 'package:studenttoolboxv3/components/Compact/compact_food_item.dart';
import 'package:studenttoolboxv3/components/Compact/compact_weight_slider.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_textfield.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';


class Deficit extends StatefulWidget {
  const Deficit({super.key});

  @override
  State<Deficit> createState() => _DeficitState();
}

class _DeficitState extends State<Deficit> {

  @override
  Widget build(BuildContext context) {
      final provider = context.watch<AnthroProvider>();
    return ExpansionTile(
      backgroundColor: const Color.fromARGB(255, 249, 251, 225),
      title: Text('Deficit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [                Text(
                  'Calories: ${(provider.lowerCalorieRange - provider.totalCalories).toStringAsFixed(0)}-${(provider.upperCalorieRange - provider.totalCalories).toStringAsFixed(0)} Kcal, ',
                ),
                Text(
                  'Protein: ${(provider.lowerProteinRange - provider.totalProtein).toStringAsFixed(0)}-${(provider.upperProteinRange - provider.totalProtein).toStringAsFixed(0)} g',
                ),],),
    );

  }
}