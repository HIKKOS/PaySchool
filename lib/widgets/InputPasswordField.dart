import 'package:flutter/material.dart';
import 'package:payschool/data/repositories/app_colors.dart';

class InputTextPassword extends StatelessWidget {
  const InputTextPassword({
    Key? key,
    required this.label,
    required this.hint,
  }) : super(key: key);
  final String label;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
              style: (TextStyle(color: AppColors.greyDark)),
            ),
          ),
        ),
      ],
    );
  }
}
