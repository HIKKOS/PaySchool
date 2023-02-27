import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/pages/Home.dart';
import 'package:hola_mundo/widgets/CardBeneficiarioServicios.dart';

import '../widgets/PurchasedServicesCard.dart';

class BeneficiarioPage extends StatelessWidget {
  const BeneficiarioPage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F8),
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.greyDark,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFEDF2F8),
        title: CustomAppBar(text: 'Detalles'),
      ),
      body: Center(
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CardBeneficiarioServicios(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12, top: 12, left: 10),
                    child: Text(
                      textAlign: TextAlign.left,
                      'Servicios contratados',
                      style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const PurchasedServicesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
