import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:hola_mundo/core/enties/service.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/data/repositories/service_repository.dart';
import 'package:hola_mundo/widgets/NavbarAlfa.dart';

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
    return MaterialApp(
      title: 'Catalogo',
      home: Scaffold(
        backgroundColor: AppColors.greyLight,
        appBar: EasySearchBar(
          elevation: 0,
          backgroundColor: AppColors.greyLight,
          title: const Text('Catalogo de servicios',
              style: TextStyle(color: AppColors.primary, fontSize: 24)),
          onSearch: (value) {
            setState(() {
              searchValue = value.toLowerCase();
              filteredServices = ServiceRepository.getServices()
                  .where((service) =>
                      service.name.toLowerCase().contains(searchValue))
                  .toList();
            });
          },
        ),
        body: SafeArea(
          child: ListService(services: filteredServices),
        ),
        bottomNavigationBar: const NavbarAlfa(),
      ),
    );
  }
}


