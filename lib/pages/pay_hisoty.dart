import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/data/repositories/payment_detail_repository.dart';

import 'package:hola_mundo/widgets/NavbarAlfa.dart';

import '../core/enties/payment_detail.dart';
import '../widgets/list_service_paid.dart';

class PayHistory extends StatefulWidget {
  const PayHistory({super.key});

  @override
  State<PayHistory> createState() => _PayHistory();
}

class _PayHistory extends State<PayHistory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historial de pagos',
      home: Scaffold(
        backgroundColor: AppColors.greyLight,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.greyLight,
          title: Text('Historial de pagos',
              style: TextStyle(color: AppColors.primary, fontSize: 24)),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                textAlign: TextAlign.left,
                'Este mes',
                style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListViewServicesPaid(
                  paymentDetails: PaymentDetailRepository.getPaymentDetail()),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                textAlign: TextAlign.left,
                'Diciembre',
                style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListViewServicesPaid(
                  paymentDetails: PaymentDetailRepository.getPaymentDetail()),
            )
          ],
        ),
        bottomNavigationBar: const NavbarAlfa(),
      ),
    );
  }
}

