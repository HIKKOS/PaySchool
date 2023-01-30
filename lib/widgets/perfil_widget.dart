import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/Icons/child.svg',
          height: 80,
          width: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Francisco Matías Gómez',
              style: TextStyle(fontSize: 20, color: Color(0xFF176BFC), fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}