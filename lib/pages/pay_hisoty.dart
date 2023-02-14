import 'package:flutter/material.dart';

import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/data/repositories/payment_detail_repository.dart';

import 'package:hola_mundo/widgets/NavbarAlfa.dart';
import 'package:hola_mundo/widgets/custom_appbar.dart';
import 'package:hola_mundo/widgets/subtitle_section.dart';

import '../widgets/list_service_paid.dart';

class PayHistory extends StatefulWidget {
  const PayHistory({super.key});

  @override
  State<PayHistory> createState() => _PayHistory();
}

class _PayHistory extends State<PayHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        title: CustomAppBar(
          text: 'Historial de pagos',
        ),
      ),
      body: ListView(
        children: [
          const SubtitleSection(
            subtitle: 'Este mes',
            color: AppColors.greyDark,
            fontsize: 24,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListViewServicesPaid(
                paymentDetails: PaymentDetailRepository.getPaymentDetail()),
          ),
          const SubtitleSection(
              subtitle: 'Enero',
              color: AppColors.greyDark,
              fontsize: 24,
              fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListViewServicesPaid(
                paymentDetails: PaymentDetailRepository.getPaymentDetail()),
          )
        ],
      ),
     
    );
  }
}
