import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repositories/app_colors.dart';
import '../providers/alumno_provider.dart';
import '../widgets/CardBeneficiarioServicios.dart';
import '../widgets/PurchasedServicesCard.dart';
import '../widgets/ServicioHome.dart';
import '../widgets/form_login.dart';
import 'Home.dart';

class BeneficiarioPage extends StatelessWidget {
  String _getFechaFormateada(int daysToAdd) {
    final DateTime today = DateTime.now();
    final DateTime exphirationDate = today.add(Duration(days: daysToAdd));
    final dateString =
        '${exphirationDate.toLocal().day}/${exphirationDate.toLocal().month}';
    return dateString;
  }

  const BeneficiarioPage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F8),
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.greyDark,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFEDF2F8),
        title: const CustomAppBar(text: 'Detalles'),
      ),
      body: Center(
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CardBeneficiarioServicios(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12, top: 12, left: 10),
                    child: Text(
                      textAlign: TextAlign.left,
                      'Servicios contratados:',
                      style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Consumer<AlumnoProvider>(
                builder: (context, alumnoProv, child) => alumnoProv
                        .isLoadingServices
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              alumnoProv.getServiciosContratados?.length ?? 0,
                          itemBuilder: (context, int index) {
                            final servicio =
                                alumnoProv.getServiciosContratados?[index];
                            logger.d(index);
                            return CustomCard(
                                text: servicio?.nombre,
                                costo: servicio?.costo,
                                diasRestantes: _getFechaFormateada(
                                    servicio!.diasRestantes));
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
