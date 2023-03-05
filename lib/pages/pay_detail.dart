import 'package:flutter/material.dart';
import 'package:hola_mundo/domain/enties/payment_detail.dart';
import 'package:hola_mundo/pages/global/app_colors.dart';
import 'package:hola_mundo/widgets/card_costo.dart';
import 'package:hola_mundo/widgets/custom_appbar.dart';
import 'package:hola_mundo/widgets/custom_card_pay.dart';
import 'package:hola_mundo/widgets/subtitle_section.dart';

class LayoutPayDetail extends StatelessWidget {
  final PaymentDetail paymentDetail;
  const LayoutPayDetail({super.key, required this.paymentDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.greyDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const CustomAppBar(text: 'Detalle de pago'),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SubtitleSection(
                  subtitle: 'Servicio',
                  color: AppColors.greyDark,
                  fontsize: 24,
                  fontWeight: FontWeight.bold),
              customCardPay(
                  icon: paymentDetail.urlIconService,
                  title: paymentDetail.nameService),
              const SubtitleSection(
                  subtitle: 'Beneficiario',
                  color: AppColors.greyDark,
                  fontsize: 24,
                  fontWeight: FontWeight.bold),
              customCardPay(
                  icon: paymentDetail.urlIconStudent,
                  title: paymentDetail.nameStudent),
              const SubtitleSection(
                  subtitle: 'Paga con',
                  color: AppColors.greyDark,
                  fontsize: 24,
                  fontWeight: FontWeight.bold),
              customCardPay(
                  icon: paymentDetail.urlIconPayment,
                  title: paymentDetail.paymentMethod),
              const SubtitleSection(
                  subtitle: 'Costo',
                  color: AppColors.greyDark,
                  fontsize: 24,
                  fontWeight: FontWeight.bold),
              CardCost(
                paymentDetail: paymentDetail,
              )
            ],
          )),
    );
  }
}

