import 'package:flutter/material.dart';
import 'package:payschool/pages/search_page.dart';
import 'package:payschool/widgets/custom_appbar.dart';

import 'package:provider/provider.dart';
import '../data/providers/services_provider.dart';
import '../widgets/card_item_service.dart';
import 'global/app_colors.dart';


class CatalogService extends StatefulWidget {
  const CatalogService({Key? key}) : super(key: key);

  @override
  _CatalogServiceState createState() => _CatalogServiceState();
}

class _CatalogServiceState extends State<CatalogService> {
  final _scrollController = ScrollController();
  final _scrollControlle = ScrollController();
  int pageIndex = 1;

   bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ServicesProvider>(context, listen: false).fetchServices(5, 1);
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      final delta = MediaQuery.of(context).size.height * 0.1;

      if (!isLoadingMore && maxScroll - currentScroll <= delta ) {
        setState(() {
          isLoadingMore = true;
        });
        Provider.of<ServicesProvider>(context, listen: false)
            .fetchServices(5, pageIndex += 1)
            .then((value) => setState(() {
              isLoadingMore = false;
            }));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        title: const CustomAppBar(text: "Catalogo de servicios"),
        actions: <Widget>[
          Consumer<ServicesProvider>(
            builder: (context, serviceProvider, child) {
              return CustomIconButton(
                  icon: Icons.filter_list,
                  funcion: () => serviceProvider.filter(context));
            },
          ),
          CustomIconButton(
              icon: Icons.search,
              funcion: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchService()));
              }),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Consumer<ServicesProvider>(
            builder: (context, serviceProvider, child) {
              if (serviceProvider.isLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Cargando datos')
                    ],
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                  pageIndex = 1;
                  await Provider.of<ServicesProvider>(context, listen: false).fetchServices(5, pageIndex);
                },
                  child: ListView.builder(
                    itemCount: serviceProvider.servicios.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        CardItemService(
                          service: serviceProvider.servicios[index],
                          icon: 'assets/icons/backArrow.svg',
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    controller: serviceProvider.services.isEmpty
                        ? _scrollControlle
                        : _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    physics: const BouncingScrollPhysics(),
                  ),
                );
              }
            },
          ),
        ),
      ),
       bottomNavigationBar: isLoadingMore ? Center(child: CircularProgressIndicator(value: 1.5, backgroundColor: Colors.transparent, color: AppColors.primary),) : null,
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




