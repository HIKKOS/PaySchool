import 'package:flutter/material.dart';

import '../core/enties/service.dart';
import '../data/repositories/app_colors.dart';

class CardItemService extends StatelessWidget {
  final Service service;
  const CardItemService({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: createTrailinItem(service),
        title: Text(service.name),
        subtitle: Text("\$${service.cost}"),
        trailing: const Icon(Icons.arrow_right_alt),
      ),
    );
  }

  createListTileItem(BuildContext context, Service service) => ListTile(
        leading: createTrailinItem(service),
        title: Text(service.name),
        subtitle: Text("\$${service.cost}"),
        trailing: const Icon(Icons.arrow_right_alt),
      );

  Container createTrailinItem(Service service) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(service.urlIcon), fit: BoxFit.contain),
      ),
    );
  }
}