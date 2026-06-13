import 'package:flutter/material.dart';

class ToolCard extends StatefulWidget {
  final String cardTitle;
  final List<Widget> content;
  final List<Widget> subtitleContent;

  const ToolCard({super.key, required this.cardTitle, required this.content, required this.subtitleContent});

  @override
  State<ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<ToolCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 225, 255),
        borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
      ),
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(widget.cardTitle, style: TextStyle(fontSize: 18)),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.expand_circle_down_outlined),
              ),
            ],
            
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(children: widget.subtitleContent),
          ),
          Column(
            children: widget.content
          )
        ],
      ),
    );
  }
}
