import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/models/food_model.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:provider/provider.dart';

class HospitalFoodEaten extends StatefulWidget {
  final int index;
  final FoodModel food;
  final VoidCallback? onAdd;
  final bool showAddButton;

  const HospitalFoodEaten({
    super.key,
    required this.index,
    required this.food,
    this.onAdd,
    this.showAddButton = true,
  });

  @override
  State<HospitalFoodEaten> createState() => _HospitalFoodEatenState();
}

class _HospitalFoodEatenState extends State<HospitalFoodEaten> {
  String selectedAmount = '1.0';
  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 226, 241, 255),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: Text(food.name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Calories: ${food.fullCalories}, Protein: ${food.fullProtein}, Portion Eaten: ${food.portionEaten}',
                      ),
                    ),
                    Row(children: [

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              if (widget.showAddButton)
                IconButton(
                  onPressed: () {
                    context.read<AnthroProvider>().deletePatientFood(
                      widget.index,
                    );
                  },

                  icon: const Icon(Icons.delete),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
