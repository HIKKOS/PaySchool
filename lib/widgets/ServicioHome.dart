import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payschool/pages/pay_detail.dart';
import 'package:payschool/providers/alumno_provider.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.text,
      required this.costo,
      this.idService = null,
      this.diasRestantes = null});
  final text;
  final costo;
  final idService;
  final diasRestantes;
  @override
  Widget build(BuildContext context) {
    final alumno = Provider.of<AlumnoProvider>(
                                      context,
                                      listen: false)
                                  .getAlumnoSeleccionado;
    var pago = Pago(servicio: text, monto: costo, alumno: alumno?.primerNombre, idService: idService);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LayoutPayDetail(paymentDetail: pago, isRenew: true,)));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    'assets/Icons/Icon.svg',
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
                            text,
                            style: const TextStyle(
                                color: Color(0xFF616161), fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '\$$costo',
                            style: const TextStyle(
                                color: Color(0xFF9A9A9A), fontSize: 18),
                          ),
                        ],
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: diasRestantes == null
                            ? SvgPicture.asset(
                    'assets/Icons/backArrow.svg',
                    height: 20,
                    width: 20,
                  )
                    :
                    Text(
                         'Vence\n${diasRestantes ?? ''}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Color(0xFF9A9A9A),
                          fontSize: 16,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pago {
  Pago({
    required this.servicio,
    required this.monto,
    required this.alumno,
    required this.idService,
  });

  final servicio;
  final monto;
  final alumno;
  final idService;
}

