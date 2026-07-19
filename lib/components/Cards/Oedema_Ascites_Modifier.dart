import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/components/Compact/compact_generic_slider.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

class OedemaAscitesModifierCard extends StatefulWidget {
  const OedemaAscitesModifierCard({super.key});

  @override
  State<OedemaAscitesModifierCard> createState() =>
      _OedemaAscitesModifierCardState();
}

class _OedemaAscitesModifierCardState extends State<OedemaAscitesModifierCard> {
  TextEditingController oedemaWeight = TextEditingController();
  TextEditingController ascitesWeight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnthroProvider>();
    return GestureDetector(
      child: ExpansionTile(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Oedema and Ascites Modifier',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (provider.oedema != 0) Text('Oedema: ${provider.oedema} kg'),
            if (provider.ascites!=0)Text('Ascites: ${provider.ascites} kg'),
          ],
        ),
        children: [
          CompactGenericSlider(
            sliderTitle: 'Oedema Weight',
            title: '${provider.oedema}kg',
            textFieldHintText: 'Oedema Wieght',
            controller: oedemaWeight,
            min: 0,
            max: 20,
            divisions: 200,
            sliderValue: provider.oedema,
            onSliderChanged: (oedema) => provider.setOedema(oedema),
            onLongPressDecrement: null,
            onLongPressIncrement: null,
            onLongPressDecrementUp: null,
            onLongPressIncrementUp: null,
            onDecrement: null,
            onIncrement: null,
            onChanged: null,
          ),
          CompactGenericSlider(
            sliderTitle: 'Ascites Weight',
            title: '${provider.ascites}kg',
            textFieldHintText: 'Ascites weight',
            controller: ascitesWeight,
            min: 0,
            max: 10,
            divisions: 100,
            sliderValue: provider.ascites,
            onSliderChanged: (newAscites)=>provider.setAscites(newAscites),
            onLongPressDecrement: null,
            onLongPressIncrement: null,
            onLongPressDecrementUp: null,
            onLongPressIncrementUp: null,
            onDecrement: null,
            onIncrement: null,
            onChanged: null,
          ),
          Text('kg: ${provider.currentkg}'),
          Text('Actual kg: ${provider.actualKg}'),
        ],
      ),
    );
  }
}
