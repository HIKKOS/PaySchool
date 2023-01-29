import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hola_mundo/pages/catalog_service.dart';
import 'package:hola_mundo/pages/pay_hisoty.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CatalogService()),
                );
              },
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                color: Color(0xFF176BFC),
                height: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 35,
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: Color(0xFFD9D9D9),
                height: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PayHistory()),
                );
              },
              iconSize: 35,
              icon: SvgPicture.asset(
                "assets/icons/history.svg",
                color: Color(0xFFD9D9D9),
                height: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 35,
              icon: SvgPicture.asset(
                "assets/icons/user.svg",
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
