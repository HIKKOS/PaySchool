import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.text,
      required this.costo,
      this.diasRestantes = null});
  final text;
  final costo;
  final diasRestantes;
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
                  'assets/Icons/Icon.svg',
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(
                  width: 230,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                              color: Color(0xFF616161), fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$$costo',
                          style: const TextStyle(
                              color: Color(0xFF9A9A9A), fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                      diasRestantes == null
                          ? ''
                          : 'Vence\n${diasRestantes ?? ''}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF9A9A9A),
                        fontSize: 16,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
