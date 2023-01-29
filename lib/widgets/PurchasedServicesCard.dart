import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';

class PurchasedServicesCard extends StatelessWidget {
  const PurchasedServicesCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/Icons/bus.svg',
                height: 60,
                width: 60,
              ),
              Container(
                  width: 220,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Colegiatura',
                          style:
                              TextStyle(color: Color(0xFF616161), fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '\$499',
                          style:
                              TextStyle(color: Color(0xFF9A9A9A), fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text('Vence: 27/04',
                      style: TextStyle(color: AppColors.greyMedium))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
