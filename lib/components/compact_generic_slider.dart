import 'package:flutter/material.dart';
import 'package:studenttoolboxv3/components/generic_textfield.dart';

class CompactGenericSlider extends StatefulWidget {
  final String sliderTitle;
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
  final Function()? onLongPressDecrementUp;
  final Function()? onLongPressIncrementUp;
  final Function()? onDecrement;
  final Function()? onIncrement;
  final Function(String)? onChanged;


  const CompactGenericSlider({

    super.key,
    required this.sliderTitle,
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
    required this.onLongPressDecrementUp,
    required this.onLongPressIncrementUp,
    required this.onDecrement,
    required this.onIncrement,
    required this.onChanged,
  });

  @override
  State<CompactGenericSlider> createState() => _CompactGenericSliderState();
}

class _CompactGenericSliderState extends State<CompactGenericSlider> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              Text(widget.sliderTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),

              GestureDetector(
                onTap: widget.onTitleTap,
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                      content: GenericTextfield(
                        controller: widget.controller,
                        hintText: widget.textFieldHintText,
                        width: 200,
                        onSubmit: (value) {
                          setState(() {
                            Navigator.of(context).pop();
                            isEdit = false;
                            widget.controller.clear();
                          });
                        },
                        onChanged: widget.onChanged,
                      ),
                    ),
                  );
                  setState(() {
                    isEdit = !isEdit;
                    widget.controller.clear();
                  });
                },
                icon: Icon(Icons.edit),
              ),
              GestureDetector(
                onLongPress: widget.onLongPressDecrement,
                onLongPressUp: widget.onLongPressDecrementUp,
                child: IconButton(
                  onPressed: widget.onDecrement,
                  icon: Icon(Icons.remove),
                ),
              ),
              GestureDetector(
                onLongPress: widget.onLongPressIncrement,
                onLongPressUp: widget.onLongPressIncrementUp,
                child: IconButton(
                  onPressed: widget.onIncrement,
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        Slider(
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          value: widget.sliderValue,
          onChanged: widget.onSliderChanged,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [

          ],
        ),
      ],
    );
  }
}
