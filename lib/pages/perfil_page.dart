import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_mundo/Controllers/update_photo_controller.dart';
import 'package:hola_mundo/Provider/tutor_provider.dart';
import 'package:hola_mundo/pages/ScreensCambioCorreo/cambio_correo_page.dart';
import 'package:hola_mundo/pages/ScreensCambioNumeroT/cambio_telefono.dart';
import 'package:hola_mundo/pages/ScreensCambioPassword/cambio_password.dart';
import 'package:hola_mundo/pages/ScreensMetodoPago/cambio_metodo_pago.dart';
import 'package:hola_mundo/widgets/Card/card_options.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PerfilPage extends StatelessWidget {
  PerfilPage({super.key});

  UpdatePhotoController updatePhotoController =
      Get.put(UpdatePhotoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ), */
        backgroundColor: Colors.transparent,
        body: Consumer<TutoProvider>(
            builder: (context, tutorProv, child) => tutorProv.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListView(
                      children: [
                        Container(
                          width: 100,
                          height: 120,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Consumer<TutoProvider>(
                                builder: (context, tutorProv, child) =>
                                    Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.transparent,
                                  child: const CircleAvatar(
                                    radius: 45,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                      'https://rest-server-node-production-109d.up.railway.app/api/fotos',
                                      headers: {
                                        "Content-Type": "application/json",
                                        "x-token":
                                            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjE1MjNmMGZhLTJlMTYtNDM2Zi1iMzg2LWRhNjU4M2U5N2NjNiIsInJvbCI6IlR1dG9yIiwiaWF0IjoxNjc3Njg4NTYxLCJleHAiOjE2Nzc3NzQ5NjF9.bC18PRjR47mRU_FHy600R9g4fxQxBLqMHjK6spE4EbA"
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Consumer<TutoProvider>(
                                  builder: (context, tutorProv, child) =>
                                      Expanded(
                                        child: Container(
                                          width: 250,
                                          height: 80,
                                          color: Colors.transparent,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    tutorProv.tutor!
                                                            .primerNombre +
                                                        ' ' +
                                                        tutorProv.tutor!
                                                            .segundoNombre +
                                                        ' ' +
                                                        tutorProv.tutor!
                                                            .apellidoPaterno +
                                                        ' ' +
                                                        tutorProv.tutor!
                                                            .apellidoMaterno,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ))
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CardOptions(
                            title: 'Correo Electrónico',
                            description: tutorProv.tutor!.correo,
                            urlImage: 'assets/Icons/correo.svg',
                            page: const CambioCorreoPage(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CardOptions(
                            title: 'Numero de telefono ',
                            description: tutorProv.tutor!.telefono,
                            urlImage: 'assets/Icons/telefono.svg',
                            page: const CambioTelefonoPage(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: CardOptions(
                            title: 'Métodos de Pago ',
                            description: '1 metodo de Pago',
                            urlImage: 'assets/Icons/PagoM.svg',
                            page: CambioMetodoPage(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: CardOptions(
                            title: 'Cambio Contraseña ',
                            description: '',
                            urlImage: 'assets/Icons/Contraseña.svg',
                            page: CambioPasswordPage(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      icon: const Icon(
                                        Icons.logout_outlined,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      title: const Text('Saliendo'),
                                      content: const Text(
                                        ' ¿Deseas cerrar sesion?',
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              print('NO');
                                              Navigator.pop(context);
                                            },
                                            child: const Text('No')),
                                        TextButton(
                                            onPressed: () {
                                              print('SI');
                                              /*Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: context => LoginPage()));*/
                                            },
                                            child: const Text('Si'))
                                      ],
                                    ));
                          },
                          child: const Text(
                            'Cerrar Sesión',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  )));
  }
}
