import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Fullsize/hospital_food.dart';
import 'package:studenttoolboxv3/models/food_model.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class IntakeEstimater extends StatefulWidget {
  const IntakeEstimater({super.key});

  @override
  State<IntakeEstimater> createState() => _IntakeEstimaterState();
}

class _IntakeEstimaterState extends State<IntakeEstimater> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.hospitalFoods.length,
              itemBuilder: (context, index) {
                return HospitalFood(
                  index: index,
                  food: provider.hospitalFoods[index],
                  onAdd: () {
                    provider.addPatientFood(provider.hospitalFoods[index]);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.patientIntake.length,
              itemBuilder: (context, index) => HospitalFood(
                index: index,
                food: provider.patientIntake[index],
                showAddButton: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
