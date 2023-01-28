import 'package:flutter/material.dart';

import '../core/enties/service.dart';
import 'card_item_service.dart';


class ListService extends StatelessWidget {
  const ListService({
    Key? key,
    required this.services,
  }) : super(key: key);

  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          CardItemService(
            service: services[index],
          ),
          const SizedBox(height: 15),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),

      physics: const BouncingScrollPhysics(),
    );
  }
}