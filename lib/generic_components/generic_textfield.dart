import 'package:flutter/material.dart';

class GenericTextfield extends StatefulWidget {
  final double width;
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  const GenericTextfield({super.key, required this.width, required this.hintText, required this.controller, this.onChanged, this.onSubmit});

  @override
  State<GenericTextfield> createState() => _GenericTextfieldState();
}

class _GenericTextfieldState extends State<GenericTextfield> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        onSubmitted: widget.onSubmit,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(border: OutlineInputBorder(), hintText: widget.hintText),
      ),
    );
  }
}
