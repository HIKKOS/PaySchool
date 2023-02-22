import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
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
                    color: Color(0xFF176BFC),
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
              style: (const TextStyle(color:Colors.grey,)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
