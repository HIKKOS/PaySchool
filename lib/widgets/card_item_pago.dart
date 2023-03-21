import 'package:flutter/material.dart';
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
  List<String> imageList = [];
  final pagosProvider =   PagoProvider();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < widget.pago?.imgPaths.length; i++) {
      String idImage =
          widget.pago?.imgPaths.isEmpty ? '' : widget.pago?.imgPaths[i];
      pagosProvider
          .getImagen('${widget.pago?.servicioId}', '${idImage}')
          .then((urlImage) {
        setState(() {
          imageList.add(urlImage);
        });
      });
    }
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 150,
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                      )),
                  child: pago.imgPaths.isEmpty
                      ? Image.asset('assets/images/no-image.jpg')
                      : ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child:
                              ImageSection(imageList: imageList, height: 150),
                        ),
                )),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${pago?.servicio}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$${pago?.monto}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primary),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LayoutPayDetail(paymentDetail: pago)));
                        },
                        child: Text('Ver más'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}