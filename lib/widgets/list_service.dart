import 'package:flutter/material.dart';
import 'package:hola_mundo/domain/repositories/response/services_response_dto.dart';

import 'card_item_service.dart';

class ListService extends StatelessWidget {
    final Key? key;
  final List<dynamic>? services;

  const ListService({this.key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services?.length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          CardItemService(
            service: services?[index],
            icon: 'assets/icons/backArrow.svg',
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
