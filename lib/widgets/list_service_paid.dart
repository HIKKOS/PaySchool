import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/enties/payment_detail.dart';
import '../data/repositories/app_colors.dart';

class ListViewServicesPaid extends StatelessWidget {
  const ListViewServicesPaid({
    Key? key,
    required this.paymentDetails,
  }) : super(key: key);

  final List<PaymentDetail> paymentDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90 * paymentDetails.length.toDouble(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: SafeArea(
        child: ListView.separated(
          itemCount: paymentDetails.length,
          itemBuilder: (BuildContext context, int index) =>
              createListTileItem(context, paymentDetails[index]),
          separatorBuilder: (_, __) => const Divider(),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          // physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

  createListTileItem(BuildContext context, PaymentDetail paymentDetail) =>
      ListTile(
        // createTrailinItem(paymentDetail)
        leading:SvgPicture.asset(
          paymentDetail.urlIconService,
          height: 60,
          width: 60,
        ) ,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(paymentDetail.nameService),
        ),
        subtitle: Text('\$${paymentDetail.costService}'),
        trailing: SvgPicture.asset(
          'assets/icons/backArrow.svg',
          height: 20,
          width: 20,
        ),
      );

  // Container createTrailinItem(PaymentDetail paymentDetail) {
  //   return Container(
  //     width: 80,
  //     height: 80,
  //     decoration: const BoxDecoration(
  //       color: AppColors.primary,
  //       shape: BoxShape.circle,
  //     ),
  //     child: imageIcon(paymentDetail),
  //   );
  // }

  // FadeInImage imageIcon(PaymentDetail paymentDetail) {
  //   return FadeInImage.assetNetwork(
  //     placeholder: 'assets/images/loading.gif',
  //     image: paymentDetail.urlIconService,
  //     fit: BoxFit.contain,
  //   );
  // }
}
