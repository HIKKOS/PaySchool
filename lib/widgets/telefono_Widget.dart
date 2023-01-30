// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CambioTelefono extends StatelessWidget {
  const CambioTelefono({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
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
                'assets/Icons/telefono.svg',
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
                    children: const [
                      Text(
                        'Numero de telefono',
                        style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '(999) 123 4567',
                        style:
                            TextStyle(color: Color(0xFF9A9A9A), fontSize: 18),
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/Icons/backArrow.svg',
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder:(context) => const CorreoPage()));
                  },
                )),
          ],
        ),
      ),
    );
  }
}