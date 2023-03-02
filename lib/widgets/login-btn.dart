import 'package:flutter/material.dart';

import '../data/repositories/app_colors.dart';

class LoginBtn extends StatefulWidget {
  const LoginBtn({
    Key? key,
    required this.horizontal,
    required this.vertical,
    required this.function,
  }) : super(key: key);
  final double horizontal;
  final double vertical;
  final Function function;

  @override
  State<LoginBtn> createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                horizontal: widget.horizontal, vertical: widget.vertical)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
        onPressed: () {
          final res = widget.function();
          if (!res) {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = true;
            });
          }
        },
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              )
            : const Text(
                'Iniciar sesión',
                style: TextStyle(fontSize: 20, color: AppColors.white),
              ));
  }
}
