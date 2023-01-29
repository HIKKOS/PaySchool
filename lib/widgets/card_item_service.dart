import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hola_mundo/pages/service_section.dart';

import '../core/enties/service.dart';
import '../data/repositories/app_colors.dart';

class CardItemService extends StatelessWidget {
  final Service service;
  const CardItemService({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: createListTileItem(context, service),
      ),
    );
  }

  createListTileItem(BuildContext context, Service service) => ListTile(
        leading: createTrailinItem(service),
        title: Padding(padding:const EdgeInsets.symmetric( vertical: 5),
            child: Text(service.name),
         ),
        subtitle: Text("\$${service.cost}"),
        trailing: SvgPicture.asset(
                  'assets/icons/backArrow.svg',
                  height: 20,
                  width: 20,
                ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LayaoutService(service: service)),
            ),
         // 
      );

  Container createTrailinItem(Service service) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: imageIcon(service),
    );
  }

  FadeInImage imageIcon(Service service) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: service.urlIcon,
      fit: BoxFit.contain,
    );
  }
}
