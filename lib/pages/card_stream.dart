import 'package:flutter/material.dart';

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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: provider.activeCardList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(provider.activeCardList[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
      provider.removeCard(index);
            },
            background: Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
            ),
            child: provider.activeCardList[index],
          );
        },
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
                  final card = provider.availableCardList[index].card;
                  final isActive = provider.isCardActive(card);

                  return ListTile(
                    title: Text(provider.availableCardList[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        if (isActive) {
                          provider.removeCardWidget(card);
                        } else {
                          provider.addCardToActiveCardList(card);
                        }
                      },
                      icon: Icon(
                        isActive ? Icons.cancel : Icons.add,
                      ),
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
