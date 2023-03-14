import 'package:flutter/material.dart';
import 'package:payschool/data/repositories/app_colors.dart';
import 'package:provider/provider.dart';
import '../data/providers/services_provider.dart';
import '../widgets/list_service.dart';
import '../widgets/text_field_search.dart';

class SearchService extends StatelessWidget {
  const SearchService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        title: Consumer<ServicesProvider>(
          builder: (context, serviceProvider, child) {
            return Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: TextFieldSearch(
                title: 'Buscar servicio...',
                funcion: (value) =>
                    serviceProvider.setSearchValue(value.toLowerCase()),
              ),
            );
          },
        ),
        actions: <Widget>[
          Consumer<ServicesProvider>(
              builder: (context, serviceProvider, child) {
            return CustomIconButton(
                icon: Icons.close,
                funcion: () {
                  serviceProvider.setStateFalse();
                  Navigator.pop(context);
                });
          })
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Consumer<ServicesProvider>(
            builder: (context, serviceProvider, child) =>
                serviceProvider.services.isEmpty
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Servicios No encontrados')
                        ],
                      ))
                    : ListService(
                        services: serviceProvider.isSearching
                            ? serviceProvider.services
                            : serviceProvider.servicios),
          ),
        ),
      ),
    );
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
