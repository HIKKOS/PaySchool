import 'package:flutter/material.dart';

import '../data/repositories/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.horizontal,
    required this.vertical,
    required this.function, required this.text,
  }) : super(key: key);
  final double horizontal;
  final double vertical;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      onPressed: () {
        function();
      },
      child:  Text(
        text,
        style: const TextStyle(fontSize: 20, color: AppColors.white),
      ),
    );
  }
}
