import 'package:flutter/material.dart';

import '../data/repositories/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.horizontal,
    required this.vertical,
    required this.function,
  }) : super(key: key);
  final double horizontal;
  final double vertical;
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
      child: const Text(
        'Iniciar sesión',
        style: TextStyle(fontSize: 20, color: AppColors.white),
      ),
    );
  }
}
