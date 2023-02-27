import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hola_mundo/pages/BeneficiarioPage.dart';

class CardBeneficiario extends StatelessWidget {
  const CardBeneficiario(
      {super.key, required this.nombre, required this.onPess});
  final String nombre;
  final onPess;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPess();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Fransisco Matías Gómez',
                      style: TextStyle(fontSize: 20, color: Color(0xFF616161))),
                ), */
                SvgPicture.asset(
                  'assets/Icons/child.svg',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(nombre,
                      style: TextStyle(fontSize: 20, color: Color(0xFF616161))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
