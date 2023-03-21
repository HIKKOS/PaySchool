import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/global/app_colors.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    Key? key,
    required this.title,
    required this.funcion,
  }) : super(key: key);

  final String title;
  final Function(String) funcion;


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
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      ),
      onChanged: (value) {
        funcion(value);
      },
    );
  }
}
