import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hola_mundo/DTOs/servicios_contratados_dto.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:provider/provider.dart';

import '../providers/alumno_provider.dart';

class PurchasedServicesCard extends StatelessWidget {
  const PurchasedServicesCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              SvgPicture.asset(
                'assets/Icons/bus.svg',
                height: 60,
                width: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* Consumer<AlumnoProvider>(
                            builder: (context, alumnoProv, child) =>
                                ListView.builder(
                              itemCount:
                                  alumnoProv.getServiciosContratados?.length,
                              itemBuilder: (context, int index) {
                                final servicio =
                                    alumnoProv.getServiciosContratados?[index];
                                return ListTile(
                                    title: Text('${servicio?.nombre}'),
                                    subtitle: Text('${servicio?.costo}'),
                                    leading: Container(
                                      height: 100,
                                      width: 100,
                                    ));
                              },
                            ),
                          ), */
                        ],
                      ),
                    ]),
              )
            ],
          )),
    );
  }
}
