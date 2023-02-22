import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';

class PurchasedServicesCard extends StatelessWidget {
  const PurchasedServicesCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            SvgPicture.asset(
              'assets/Icons/bus.svg',
              height: 60,
              width: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Colegiatura',
                        style:
                            TextStyle(color: Color(0xFF616161), fontSize: 20),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '\$499',
                        style:
                            TextStyle(color: Color(0xFF9A9A9A), fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
