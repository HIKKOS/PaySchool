import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:payschool/data/providers/pay_provider.dart';
import 'package:payschool/pages/search_pay.dart';
import 'package:payschool/widgets/card_item_pago.dart';
import 'package:payschool/widgets/custom_appbar.dart';
import 'package:payschool/widgets/subtitle_section.dart';
import 'package:provider/provider.dart';
import 'global/app_colors.dart';

class PayHistory extends StatefulWidget {
  const PayHistory({Key? key}) : super(key: key);

  @override
  _PayHistoryState createState() => _PayHistoryState();
}

class _PayHistoryState extends State<PayHistory> {
  final _scrollController = ScrollController();
  final _scrollControlle = ScrollController();
  int pageIndex = 1;

  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    Provider.of<PagoProvider>(context, listen: false).fetchPagos(5, 1);
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      final delta = MediaQuery.of(context).size.height * 0.1;

      if (!isLoadingMore &&
          maxScroll - currentScroll <= delta &&
          !Provider.of<PagoProvider>(context, listen: false).pays.isEmpty) {
        setState(() {
          isLoadingMore = true;
        });

        Provider.of<PagoProvider>(context, listen: false)
            .fetchPagos(5, pageIndex += 1)
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
    final List<String> meses = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        title: const CustomAppBar(text: "Historial de pagos"),
        // actions: <Widget>[
        //   Consumer<PagoProvider>(
        //     builder: (context, pagoProvider, child) {
        //       return CustomIconButton(
        //           icon: Icons.filter_list,
        //           funcion: () => pagoProvider.filter(context));
        //     },
        //   ),
        //   Consumer<PagoProvider>(
        //     builder: (context, serviceProvider, child) {
        //       return CustomIconButton(
        //           icon: Icons.search,
        //           funcion: () {
        //             serviceProvider.setStateFalse();
        //             Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => SearchPay()));
        //           });
        //     },
        //   ),
        // ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Consumer<PagoProvider>(
            builder: (context, pagoProvider, child) {
              if (pagoProvider.isLoading) {
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
                    await Provider.of<PagoProvider>(context, listen: false)
                        .fetchPagos(5, pageIndex);
                  },
                  child: GroupedListView<dynamic, String>(
                    controller: pagoProvider.pays.isEmpty
                        ? _scrollControlle
                        : _scrollController,
                    elements: pagoProvider.pagos,
                    groupBy: (element) =>
                        '${element.fechaPago.year}-${meses[element.fechaPago.month - 1]}-${element.fechaPago.day}',
                    groupSeparatorBuilder: (String value) => Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 10),
                      child: SubtitleSection(
                          subtitle: value,
                          color: AppColors.greyDark,
                          fontsize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    itemBuilder: (context, element) => Column(
                      children: [
                        CardItemPago(
                          pago: element,
                          icon: 'assets/Icons/pay.svg',
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    order: pagoProvider.invertir == false
                        ? GroupedListOrder.DESC
                        : GroupedListOrder.ASC,
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
      bottomNavigationBar: isLoadingMore
          ? const Center(
              child: CircularProgressIndicator(
                  value: 2,
                  backgroundColor: Colors.transparent,
                  color: AppColors.primary),
            )
          : null,
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
