import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_food_eaten.dart';
import 'package:studenttoolboxv3/components/Compact/compact_food_item.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class EstimatedIntake extends StatefulWidget {
  const EstimatedIntake({super.key});

  @override
  State<EstimatedIntake> createState() => _EstimatedIntakeState();
}

class _EstimatedIntakeState extends State<EstimatedIntake> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return ExpansionTile(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      title: Text(
        'Estimated Intake',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        'Calorie Intake: ${provider.totalCalories.toStringAsFixed(0)} kcal\nProtein Intake: ${provider.totalProtein.toStringAsFixed(0)} g',
      ),
      children: [
        Container(
          height: 330,
          child: PageView(
            controller: _pageController,
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:14.0),
                    child: Text('Menu',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  ExpansionTile(
                    title: Text('Breakfast'),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.hospitalBreakfast.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CompactFoodItem(
                              index: index,
                              food: provider.hospitalBreakfast[index],
                              onAdd: () {
                                provider.addPatientFood(
                                  provider.hospitalBreakfast[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Lunch'),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.hospitalMeals.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CompactFoodItem(
                              index: index,
                              food: provider.hospitalMeals[index],
                              onAdd: () {
                                provider.addPatientFood(
                                  provider.hospitalMeals[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Tea'),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.hospitalMeals.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CompactFoodItem(
                              index: index,
                              food: provider.hospitalMeals[index],
                              onAdd: () {
                                provider.addPatientFood(
                                  provider.hospitalMeals[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Snacks'),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.hospitalSnacks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CompactFoodItem(
                              index: index,
                              food: provider.hospitalSnacks[index],
                              onAdd: () {
                                provider.addPatientFood(
                                  provider.hospitalSnacks[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Drinks'),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.hospitalDrinks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CompactFoodItem(
                              index: index,
                              food: provider.hospitalDrinks[index],
                              onAdd: () {
                                provider.addPatientFood(
                                  provider.hospitalDrinks[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('ONS'),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.hospitalONS.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CompactFoodItem(
                              index: index,
                              food: provider.hospitalONS[index],
                              onAdd: () {
                                provider.addPatientFood(
                                  provider.hospitalONS[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                 
                  itemCount: provider.patientIntake.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CompactFoodEaten(
                      index: index,
                      food: provider.patientIntake[index],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(Icons.arrow_left),
            ),
            IconButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ],
    );
  }
}
