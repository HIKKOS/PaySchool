import 'package:flutter/material.dart';
import 'package:hola_mundo/core/enties/service.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/data/repositories/service_repository.dart';
import 'package:hola_mundo/widgets/NavbarAlfa.dart';
import 'package:hola_mundo/widgets/custom_appbar.dart';

import '../widgets/list_service.dart';
import '../widgets/text_field_search.dart';

class CatalogService extends StatefulWidget {
  const CatalogService({super.key});

  @override
  State<CatalogService> createState() => _CatalogServiceState();
}

class _CatalogServiceState extends State<CatalogService> {
  String searchValue = '';
  List<Service> Services = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    Services = ServiceRepository.getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        title: !isSearching
            ? const CustomAppBar(text: "Catalogo de servicios")
            : Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: TextFieldSearch(
                  title: 'Buscar servicio...',
                  funcion: (value) => setStateSearch(value),
                ),
              ),
        actions: <Widget>[
          if (!isSearching)
            CustomIconButton(icon: Icons.search, funcion: setStateTrue),
          if (isSearching)
            CustomIconButton(icon: Icons.close, funcion: setStateFalse),
          if (isSearching)
            CustomIconButton(icon: Icons.filter_list, funcion: filter)
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListService(services: Services),
        ),
      ),
    );
  }

  void setStateFalse() {
    setState(() {
      isSearching = false;
      Services = ServiceRepository.getServices();
    });
  }

  void setStateTrue() {
    setState(() {
      isSearching = true;
    });
  }

  void setStateSearch(String value) {
    setState(() {
      searchValue = value.toLowerCase();
      Services = ServiceRepository.getServices()
          .where((service) => service.name.toLowerCase().contains(searchValue))
          .toList();
    });
  }

  void filter() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 60,
        AppBar().preferredSize.height + 30,
        0,
        0,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'alfabeto',
          child: Row(
            children: const <Widget>[
              Icon(Icons.sort_by_alpha),
              SizedBox(width: 10),
              Text('Alfabeto'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'precio',
          child: Row(
            children: const <Widget>[
              Icon(Icons.attach_money),
              SizedBox(width: 10),
              Text('Precio'),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value == 'alfabeto') {
        setState(() {
          Services.sort((a, b) => a.name.compareTo(b.name));
        });
      } else if (value == 'precio') {
        setState(() {
          Services.sort((a, b) => a.cost.compareTo(b.cost));
        });
      }
    });
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.icon, required this.funcion});
  final IconData icon;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: AppColors.greyDark),
      onPressed: () {
        funcion();
      },
    );
  }
}
