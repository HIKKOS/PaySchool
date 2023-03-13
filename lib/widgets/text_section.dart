import 'package:flutter/material.dart';


class TextSection extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const TextSection({super.key, required this.text, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(color: color, fontSize: fontSize),
      ),
    );
  }
}
