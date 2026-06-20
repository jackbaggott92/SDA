import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/models/food_model.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';
import 'package:provider/provider.dart';

class HospitalFood extends StatefulWidget {
  final int index;
  final FoodModel food;
  final VoidCallback? onAdd;
  final bool showAddButton;

  const HospitalFood({
    super.key,
    required this.index,
    required this.food,
    this.onAdd,
    this.showAddButton = true,
  });

  @override
  State<HospitalFood> createState() => _HospitalFoodState();
}

class _HospitalFoodState extends State<HospitalFood> {
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
                color: const Color.fromARGB(255, 189, 223, 255),
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
                    Row(
                      children: [
                        SegmentedButton(
                          showSelectedIcon: false,
                          segments: const [
                            ButtonSegment(value: '0.25', label: Text('1/4')),
                            ButtonSegment(value: '0.50', label: Text('1/2')),
                            ButtonSegment(value: '0.75', label: Text('3/4')),
                            ButtonSegment(value: '1.0', label: Text('1')),
                          ],
                          selected: {selectedAmount},
                          onSelectionChanged: (newSelection) {
                            setState(() {
                              selectedAmount = newSelection.first;
                            });
                          },
                        ),
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
                    final fraction = double.parse(selectedAmount);

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
