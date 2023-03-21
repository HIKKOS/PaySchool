import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payschool/widgets/form_login.dart';
import 'package:provider/provider.dart';

import '../providers/alumno_provider.dart';

class CardBeneficiarioServicios extends StatelessWidget {
  const CardBeneficiarioServicios({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/Icons/child.svg',
                height: 70,
                width: 70,
              ),
              SizedBox(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<AlumnoProvider>(
                      builder: (context, alumnoProv, child) => Text(
                        (alumnoProv.getAlumnoSeleccionadoNombreCompleto) ??
                            'No hay nombre',
                        softWrap: true,
                        style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: alumnoProv
                                        .getAlumnoSeleccionadoNombreCompleto!
                                        .length >=
                                    20
                                ? 18
                                : 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
