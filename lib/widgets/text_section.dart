import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';

class TextSection extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const TextSection({super.key, required this.text, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            softWrap: true,
            style: TextStyle(color: color, fontSize: fontSize),
          ),
        ));
  }
}
