import 'package:flutter/material.dart';

import '../data/repositories/app_colors.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch(
      {super.key, required this.title, required this.funcion});
  final String title;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
         filled: true,
        fillColor: Colors.white,
        hintText: title,
        hintStyle: const TextStyle(color: AppColors.greyMedium),
        prefixIcon: const Icon(Icons.search, color: AppColors.greyDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.greyDark),
      ),
      ),
      onChanged: (value) {
        funcion(value);
      },
    );
  }
}
