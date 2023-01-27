

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:hola_mundo/core/enties/service.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/data/repositories/service_repository.dart';

import '../widgets/card_item_service.dart';
import '../widgets/list_service.dart';


class CatalogService extends StatefulWidget {
  const CatalogService({super.key});

  @override
  State<CatalogService> createState() => _CatalogServiceState();
}

class _CatalogServiceState extends State<CatalogService> {
  String searchValue = '';
  List<Service> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices = ServiceRepository.getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyLight,
        appBar: EasySearchBar(
          backgroundColor: AppColors.greyLight,
          title: const Text(
            'Catalogo de servicios',
            style: TextStyle(color: AppColors.primary),
          ), 
          onSearch: (value) {
            setState(() {
              searchValue = value;
              filteredServices = ServiceRepository.getServices().where((service) => service.name.contains(searchValue)).toList();
            });
          },
        ),
        body: SafeArea(
          child: ListService(services: filteredServices),
        ));
  }
}






