import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Fullsize/generic_textfield.dart';
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
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    final food = widget.food;
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              // SizedBox(
              Container(
                color: Colors.amberAccent,
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
                        'Calories: ${food.fullCalories}, Protein: ${food.fullProtein}',
                      ),
                    ),
                    Row(
                      children: [
                        SegmentedButton(
                          segments: const [
                            ButtonSegment(value: '0.25', label: Text('1/4')),
                            ButtonSegment(value: '0.50', label: Text('1/2')),
                            ButtonSegment(value: '0.75', label: Text('3/4')),
                            ButtonSegment(value: '1.0', label: Text('1')),
                          ],
                          selected: const {'1'},
                          onSelectionChanged: (newSelection) {
                            // Handle selection change
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
                  onPressed:
                      widget.onAdd ??
                      () {
                        provider.addPatientFood(food);
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
