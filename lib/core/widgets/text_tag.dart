import 'package:flutter/material.dart';

class TextTagWidget extends StatefulWidget {
  final String text;
  final Color boxColor;
  const TextTagWidget({
    super.key,
    required this.text,
    this.boxColor = Colors.transparent,
  });

  @override
  State<TextTagWidget> createState() => _TextTagWidgetState();
}

class _TextTagWidgetState extends State<TextTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: widget.boxColor,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(widget.text, style: TextStyle(color: Colors.white)),
    );
  }
}
