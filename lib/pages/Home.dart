import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';

import '../data/repositories/app_colors.dart';
import '../providers/alumno_provider.dart';
import '../widgets/Card_Beneficiario.dart';
import 'BeneficiarioPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFFEDF2F8),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFEDF2F8),
          title: const CustomAppBar(text: 'Inicio'),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Consumer<AlumnoProvider>(
                  builder: (context, alumnoProv, child) => alumnoProv.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : alumnoProv.getAlumnos?.length != 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  FlutterCarousel(
                                      options: CarouselOptions(
                                        height: 200.0,
                                        showIndicator: true,
                                        slideIndicator:
                                            const CircularSlideIndicator(
                                                currentIndicatorColor:
                                                    AppColors.primary,
                                                indicatorBackgroundColor:
                                                    AppColors.greyDark),
                                      ),
                                      items:
                                          (alumnoProv.getAlumnos?.map((alumno) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            final nombre =
                                                '${alumno.primerNombre} ${alumno.apellidoPaterno} ${alumno.apellidoMaterno}';
                                            return CardBeneficiario(
                                                nombre: nombre,
                                                onPess: () {
                                                  alumnoProv
                                                      .setAlumnoSeleccionado(
                                                          AlumnoDTO: alumno);
                                                  alumnoProv
                                                      .fetchServiciosAlumno();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BeneficiarioPage()));
                                                });
                                          },
                                        );
                                      }).toList())),
                                  //consumo serv

                                  Consumer<AlumnoProvider>(
                                      builder: (context, alumnoProv, child) =>
                                          alumnoProv.isLoadingServices
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : Text(''
                                                  /* 'lenght  ${alumnoProv.getServiciosContratados?.toList().map((s) => {
                                                        (s.diasRestantes <= 7)
                                                      }).toString()}' */
                                                  ))
                                ])
                          : Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 25),
                                  child: Text(
                                    'No hay tienes tutorados registrados',
                                    style: TextStyle(color: Colors.red),
                                  )))

                  /*  Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      textAlign: TextAlign.left,
                      'Servicios por pagar',
                      style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ), */
                  /*  SizedBox(
                height: 400,
                width: width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const CustomCard();
                  },
                ),
              ), */
                  ),
            ],
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Color(0xFF176BFC), fontSize: 24),
      ),
    );
  }
}
