import 'package:flutter/material.dart';
import 'package:payschool/pages/global/app_colors.dart';
import 'package:payschool/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../data/providers/services_provider.dart';
import '../widgets/list_service.dart';
import '../widgets/text_field_search.dart';

class CatalogService extends StatefulWidget {
  const CatalogService({super.key});

  @override
  State<CatalogService> createState() => _CatalogServiceState();
}

class _CatalogServiceState extends State<CatalogService> {
  @override
  void initState() {
    super.initState();
    Provider.of<ServicesProvider>(context, listen: false)
        .fetchServices('5', '1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        title: Consumer<ServicesProvider>(
          builder: (context, serviceProvider, child) {
            return !serviceProvider.isSearching
                ? const CustomAppBar(text: "Catalogo de servicios")
                : Container(
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
              return !serviceProvider.isSearching
                  ? CustomIconButton(
                      icon: Icons.search, funcion: serviceProvider.setStateTrue)
                  : CustomIconButton(
                      icon: Icons.close,
                      funcion: serviceProvider.setStateFalse);
            },
          ),
          Consumer<ServicesProvider>(
            builder: (context, serviceProvider, child) {
              return serviceProvider.isSearching
                  ? CustomIconButton(
                      icon: Icons.filter_list,
                      funcion: () => serviceProvider.filter(context))
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
          child: Consumer<ServicesProvider>(
            builder: (context, serviceProvider, child) =>
                serviceProvider.isLoading
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Cargando datos')
                        ],
                      ))
                    : ListService(services: serviceProvider.services),
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


// class ServicesProvider with ChangeNotifier {
//   String _searchValue = '';
//   bool _isSearching = false;
//   List<serviceProvider> _services = ServiceRepository.getServices();

//   List<serviceProvider> get filteredServices {
//     return _services
//         .where((serviceProvider) =>
//             serviceProvider.name.toLowerCase().contains(_searchValue.toLowerCase()))
//         .toList();
//   }

//   bool get isSearching => _isSearching;

//   void setSearchValue(String value) {
//     _searchValue = value;
//     notifyListeners();
//   }

//   void setStateFalse() {
//     _isSearching = false;
//     _searchValue = '';
//     _services = ServiceRepository.getServices();
//     notifyListeners();
//   }

//   void setStateTrue() {
//     _isSearching = true;
//     notifyListeners();
//   }

//   void filter(BuildContext context) {
//     showMenu<String>(
//       context: context,
//       position: RelativeRect.fromLTRB(
//         MediaQuery.of(context).size.width - 60,
//         AppBar().preferredSize.height + 30,
//         0,
//         0,
//       ),
//       items: [
//         PopupMenuItem<String>(
//           value: 'alfabeto',
//           child: Row(
//             children: const <Widget>[
//               Icon(Icons.sort_by_alpha, color: AppColors.greyDark),
//               SizedBox(width: 10),
//               Text('Alfabeto'),
//             ],
//           ),
//         ),
//         const PopupMenuDivider(),
//         PopupMenuItem<String>(
//           value: 'precio',
//           child: Row(
//             children: const <Widget>[
//               Icon(Icons.attach_money, color: AppColors.greyDark),
//               SizedBox(width: 10),
//               Text('Precio'),
//             ],
//           ),
//         ),
//       ],
//     ).then((value) {
//       if (value == 'alfabeto') {
//         _services.sort((a, b) => a.name.compareTo(b.name));
//       } else if (value == 'precio') {
//         _services.sort((a, b) => a.cost.compareTo(b.cost));
//       }
//       notifyListeners();
//     });
//   }
// }