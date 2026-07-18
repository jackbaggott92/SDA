import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/Cards/Estimated_requirements_card.dart';
import 'package:studenttoolboxv3/components/Cards/Deficit_card.dart';
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
          IconButton(onPressed: (){provider.clearCardList(); provider.clearAll();

          }, icon: Icon(Icons.cancel_presentation))
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: provider.activeCardList.length,
          itemBuilder: (context, index) {
            return provider.activeCardList[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 75, 15, 131),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: SizedBox(height: 300, width: double.maxFinite,
              child: ListView.builder(
                
                itemCount: provider.availableCardList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(provider.availableCardList[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        provider.addCardToActiveCardList(
                          provider.availableCardList[index].card,
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
