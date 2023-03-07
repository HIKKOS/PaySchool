import 'package:flutter/material.dart';

import 'package:payschool/pages/global/app_colors.dart';
import 'package:payschool/domain/repositories/payment_detail_repository.dart';
import 'package:payschool/widgets/custom_appbar.dart';
import 'package:payschool/widgets/subtitle_section.dart';

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
