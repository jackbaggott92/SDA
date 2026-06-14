import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/fullsize/generic_textfield.dart';


class GenericSlider extends StatefulWidget {
  final String title;
  final String textFieldHintText;
  final Function()? onTitleTap;
  final TextEditingController controller;
  final Function(String)? onTextChanged;
  final double min;
  final double max;
  final int? divisions;
  final double sliderValue;
  final Function(double)? onSliderChanged;
  final Function()? onLongPressDecrement;
  final Function()? onLongPressIncrement;
  final Function()? onLongPressDecrementRelease;
  final Function()? onLongPressIncrementRelease;
  final Function()? onDecrement;
  final Function()? onIncrement;
  final Function(String)? onChanged;



  const GenericSlider({
    super.key,
    this.onTitleTap,
    required this.title,
    required this.textFieldHintText,
    required this.controller,
    this.onTextChanged,
    required this.min,
    required this.max,
    this.divisions,
    required this.sliderValue,
    required this.onSliderChanged,
    required this.onLongPressDecrement,
    required this.onLongPressIncrement,
    required this.onLongPressDecrementRelease,
    required this.onLongPressIncrementRelease,
    required this.onDecrement,
    required this.onIncrement,
    required this.onChanged,


  });

  @override
  State<GenericSlider> createState() => _GenericSliderState();
}

class _GenericSliderState extends State<GenericSlider> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isEdit)
                GenericTextfield(
                  controller: widget.controller,
                  hintText: widget.textFieldHintText,
                  width: 200,
                  onSubmit: (value) {
                    setState(() {
                      isEdit = false;
                      widget.controller.clear();
                      

                    });
                  },
                  onChanged: widget.onChanged,
                )
              else
                GestureDetector(
                  onTap: widget.onTitleTap,
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isEdit = !isEdit;
                      widget.controller.clear();
                    });
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
            ],
          ),
        ),
        Slider(
          min: widget.min,
          max: widget.max,
          divisions:widget.divisions,
          value: widget.sliderValue,
          onChanged: widget.onSliderChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onLongPress: widget.onLongPressDecrement,
              onLongPressUp: widget.onLongPressDecrementRelease,
              child: IconButton(
                onPressed: widget.onDecrement,
                icon: Icon(Icons.remove),
              ),
            ),
            GestureDetector(
              onLongPress: widget.onLongPressIncrement,
              onLongPressUp: widget.onLongPressIncrementRelease,
              child: IconButton(
                onPressed: widget.onIncrement,
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
