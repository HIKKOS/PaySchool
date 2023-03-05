import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/global/app_colors.dart';

import '../domain/enties/payment_detail.dart';

class CardCost extends StatelessWidget {
  final PaymentDetail paymentDetail;
  const CardCost({
    Key? key,
    required this.paymentDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iva = (paymentDetail.costService * .16);
    var costo = paymentDetail.costService - iva;
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const HeaderCard(
              title: 'Desglose',
              color: AppColors.greyDark,
              fontsize: 20,
              fontWeight: FontWeight.bold,
            ),
            const Divider(color: Color(0xFFC1C7D1), height: 2),
            ItemCard(
              colum1: 'Costo:',
              color: AppColors.greyDark,
              colum2: '\$' + costo.toStringAsFixed(2),
              color2: AppColors.greyMedium,
              fontsize: 15,
              fontWeight: FontWeight.normal,
            ),
            const Divider(color: Color(0xFFC1C7D1), height: 2),
            ItemCard(
              colum1: 'IVA',
              color: AppColors.greyDark,
              colum2: '\$' + iva.toStringAsFixed(2),
              color2: AppColors.greyMedium,
              fontsize: 15,
              fontWeight: FontWeight.normal
            ),
            const Divider(color: Color(0xFFC1C7D1), height: 2),
            FooterCard(
              colum1: 'Total',
              colum2: '\$' + paymentDetail.costService.toString(),
              color: AppColors.greyDark,
              fontsize: 18,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String colum1;
  final String colum2;
  final Color color;
  final Color color2;
  final double fontsize;
  final FontWeight fontWeight;

  const ItemCard({
    Key? key,
    required this.colum1,
    required this.colum2,
    required this.color,
    required this.fontsize,
    required this.fontWeight, required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            colum1,
            style: TextStyle(
                color: color, fontSize: fontsize, fontWeight: fontWeight),
          ),
          Text(
            colum2,
            style: TextStyle(
                color: color2, fontSize: fontsize, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String title;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;

  const HeaderCard({
    Key? key,
    required this.title,
    required this.color,
    required this.fontsize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: color, fontSize: fontsize, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}

class FooterCard extends StatelessWidget {
  final String colum1;
  final String colum2;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;

  const FooterCard({
    Key? key,
    required this.colum1,
    required this.colum2,
    required this.color,
    required this.fontsize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            colum1,
            style: TextStyle(
                color: color, fontSize: fontsize, fontWeight: fontWeight),
          ),
          Text(
            colum2,
            style: TextStyle(
                color: color, fontSize: fontsize, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
