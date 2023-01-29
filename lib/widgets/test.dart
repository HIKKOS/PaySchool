import 'package:flutter/material.dart';

class RoundedInputText extends StatelessWidget {
  final String label;
  const RoundedInputText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      filled: true,
      labelText: label,
    ));
  }
}
