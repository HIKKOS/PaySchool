import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardBeneficiario extends StatelessWidget {
  const CardBeneficiario({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Beneficiario',
                style: TextStyle(fontSize: 24, color: Color(0xFF616161))),
          ),
          SvgPicture.asset(
            'assets/Icons/child.svg',
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.circle, size: 10, color: Color(0xFF176BFC)),
              SizedBox(width: 10),
              Icon(Icons.circle, size: 10, color: Color(0xFFD9D9D9))
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Fransisco Matías Gómez',
                style: TextStyle(fontSize: 20, color: Color(0xFF616161))),
          )
        ],
      ),
    );
  }
}
