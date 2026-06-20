import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/models/food_model.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class CompactFoodItem extends StatefulWidget {
  final int index;
  final FoodModel food;
  final VoidCallback? onAdd;
  final bool showAddButton;

  const CompactFoodItem({
    super.key,
    required this.index,
    required this.food,
    this.onAdd,
    this.showAddButton = true,
  });

  @override
  State<CompactFoodItem> createState() => _CompactFoodItemState();
}

class _CompactFoodItemState extends State<CompactFoodItem> {
  double selectedAmount = 1;
  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Row(
      children: [
        Expanded(child: Text(food.name)),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Slider(
                divisions: 3,
                min: 0.25,
                max: 1,
                value: selectedAmount,
                onChanged: (value) {
                  setState(() {
                    selectedAmount = value;
                  });
                },
              ),
              Text('${selectedAmount}'),
              IconButton(
                onPressed: () {
                  final fraction = selectedAmount;

                  final estimatedCalories = FoodModel(
                    name: widget.food.name,
                    fullCalories: widget.food.fullCalories * fraction,
                    fullProtein: widget.food.fullProtein * fraction,
                    portionEaten: fraction,
                  );

                  context.read<AnthroProvider>().addPatientFood(
                    estimatedCalories,
                  );
                },

                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
