import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServicioHome extends StatelessWidget {
  const ServicioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  'assets/Icons/bus.svg',
                  height: 60,
                  width: 60,
                ),
              ),
              Container(
                  width: 230,
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'assets/Icons/backArrow.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
