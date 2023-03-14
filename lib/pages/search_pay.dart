import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:payschool/data/providers/pay_provider.dart';
import 'package:payschool/data/repositories/app_colors.dart';
import 'package:payschool/widgets/card_item_pago.dart';
import 'package:payschool/widgets/subtitle_section.dart';
import 'package:provider/provider.dart';
import '../widgets/text_field_search.dart';

class SearchPay extends StatelessWidget {
  const SearchPay({super.key});

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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        title: Consumer<PagoProvider>(
          builder: (context, pagoProvider, child) {
            return Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: TextFieldSearch(
                title: 'Buscar servicio...',
                funcion: (value) => 
                  pagoProvider.setSearchValue(value.toLowerCase()),
              ),
            );
          },
        ),
        actions: <Widget>[
          CustomIconButton(
              icon: Icons.close,
              funcion: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Consumer<PagoProvider>(
            builder: (context, pagoProvider, child) =>
                pagoProvider.pays.isEmpty 
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
                    :  GroupedListView<dynamic, String>(
                    elements: pagoProvider.pays,
                    groupBy: (element) =>
                        '${element.fechaPago.day}-${meses[element.fechaPago.month - 1]}-${element.fechaPago.year}',
                    groupSeparatorBuilder: (String value) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
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
                          icon: 'assets/icons/backArrow.svg',
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
                  ) ,
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
