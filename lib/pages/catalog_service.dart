import 'package:flutter/material.dart';
import 'package:hola_mundo/core/enties/service.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/data/repositories/service_repository.dart';
import 'package:hola_mundo/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../widgets/list_service.dart';
import '../widgets/text_field_search.dart';

class CatalogService extends StatelessWidget {
  const CatalogService({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatalogServiceModel(),
      child: Scaffold(
        backgroundColor: AppColors.greyLight,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.greyLight,
          title: Consumer<CatalogServiceModel>(
            builder: (context, model, child) {
              return !model.isSearching
                  ? const CustomAppBar(text: "Catalogo de servicios")
                  : Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextFieldSearch(
                        title: 'Buscar servicio...',
                        funcion: (value) =>
                            model.setSearchValue(value.toLowerCase()),
                      ),
                    );
            },
          ),
          actions: <Widget>[
            Consumer<CatalogServiceModel>(
              builder: (context, model, child) {
                return !model.isSearching
                    ? CustomIconButton(
                        icon: Icons.search, funcion: model.setStateTrue)
                    : CustomIconButton(
                        icon: Icons.close, funcion: model.setStateFalse);
              },
            ),
            Consumer<CatalogServiceModel>(
              builder: (context, model, child) {
                return model.isSearching
                    ? CustomIconButton(
                        icon: Icons.filter_list,
                        funcion: () => model.filter(context))
                    : SizedBox.shrink();
              },
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Consumer<CatalogServiceModel>(
              builder: (context, model, child) {
                return ListService(services: model.filteredServices);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CatalogServiceModel with ChangeNotifier {
  String _searchValue = '';
  bool _isSearching = false;
  List<Service> _services = ServiceRepository.getServices();

  List<Service> get filteredServices {
    return _services
        .where((service) =>
            service.name.toLowerCase().contains(_searchValue.toLowerCase()))
        .toList();
  }

  bool get isSearching => _isSearching;

  void setSearchValue(String value) {
    _searchValue = value;
    notifyListeners();
  }

  void setStateFalse() {
    _isSearching = false;
    _searchValue = '';
    _services = ServiceRepository.getServices();
    notifyListeners();
  }

  void setStateTrue() {
    _isSearching = true;
    notifyListeners();
  }

  void filter(BuildContext context) {
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
              Icon(Icons.sort_by_alpha, color: AppColors.greyDark),
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
              Icon(Icons.attach_money, color: AppColors.greyDark),
              SizedBox(width: 10),
              Text('Precio'),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value == 'alfabeto') {
        _services.sort((a, b) => a.name.compareTo(b.name));
      } else if (value == 'precio') {
        _services.sort((a, b) => a.cost.compareTo(b.cost));
      }
      notifyListeners();
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
