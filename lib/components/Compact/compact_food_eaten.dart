import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/models/food_model.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class CompactFoodEaten extends StatefulWidget {
  final int index;
  final FoodModel food;
  final VoidCallback? onAdd;
  final bool showAddButton;

  const CompactFoodEaten({
    super.key,
    required this.index,
    required this.food,
    this.onAdd,
    this.showAddButton = true,
  });

  @override
  State<CompactFoodEaten> createState() => _CompactFoodEatenState();
}

class _CompactFoodEatenState extends State<CompactFoodEaten> {
  double selectedAmount = 1;
  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Row(
      children: [
        Expanded(child: Text('${food.name} (${food.portionEaten})')),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Calories: ${(food.fullCalories).toStringAsFixed(0)} kcal '),
              Text('Protein: ${(food.fullProtein).toStringAsFixed(0)} g'),

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
