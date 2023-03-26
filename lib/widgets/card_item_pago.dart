import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payschool/data/providers/pay_provider.dart';
import 'package:payschool/pages/pay_detail.dart';
import 'package:payschool/widgets/image_section.dart';
import '../pages/global/app_colors.dart';

class CardItemPago extends StatefulWidget {
  final dynamic? pago;
  final String icon;
  const CardItemPago({super.key, required this.pago, required this.icon});

  @override
  State<CardItemPago> createState() => _CardItemPagoState();
}

class _CardItemPagoState extends State<CardItemPago> {
  // List<String> imageList = [];
  final pagosProvider = PagoProvider();

  @override
  void initState() {
    super.initState();

    // for (var i = 0; i < widget.pago?.imgPaths.length; i++) {
    //   String idImage =
    //       widget.pago?.imgPaths.isEmpty ? '' : widget.pago?.imgPaths[i];
    //   pagosProvider
    //       .getImagen('${widget.pago?.servicioId}', '${idImage}')
    //       .then((urlImage) {
    //     setState(() {
    //       imageList.add(urlImage);
    //     });
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return createListTileItem(context, widget.pago);
  }

  createListTileItem(BuildContext context, dynamic pago) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LayoutPayDetail(paymentDetail: pago)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  'assets/Icons/PagoM.svg',
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(
                  width: 230,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pago?.servicio,
                          style: const TextStyle(
                              color: Color(0xFF616161), fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$${pago?.monto}',
                          style: const TextStyle(
                              color: Color(0xFF9A9A9A), fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: SvgPicture.asset(
                    'assets/Icons/backArrow.svg',
                    height: 20,
                    width: 20,
                  )),
            ],
          ),
        ),
      ));
}
