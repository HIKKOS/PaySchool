import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarAlfa extends StatelessWidget {
  const NavbarAlfa({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              iconSize: 35,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/Icons/search.svg",
                color: Color(0xFFD9D9D9),
                height: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 35,
              icon: SvgPicture.asset(
                "assets/Icons/home.svg",
                color: Color(0xFF176BFC),
                height: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 35,
              icon: SvgPicture.asset(
                "assets/Icons/history.svg",
                color: Color(0xFFD9D9D9),
                height: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 35,
              icon: SvgPicture.asset(
                "assets/Icons/user.svg",
                color: Color(0xFFD9D9D9),
                height: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

