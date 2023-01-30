// ignore: file_names
import 'package:flutter/material.dart';

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
          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF176BFC)),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
              ),
      onPressed: () {
        function();
      },
      child: const Text(
        'Verificar',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}