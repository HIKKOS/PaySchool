import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payschool/Controllers/update_photo_controller.dart';
import 'package:payschool/data/Config.dart';
import 'package:payschool/pages/Login.dart';
import 'package:payschool/pages/ScreensCambioCorreo/cambio_correo_page.dart';
import 'package:payschool/pages/ScreensCambioNumeroT/cambio_telefono.dart';
import 'package:payschool/pages/ScreensCambioPassword/cambio_password.dart';
import 'package:payschool/pages/ScreensMetodoPago/cambio_metodo_pago.dart';
import 'package:payschool/widgets/Card/card_options.dart';
import 'package:payschool/widgets/avatarProfile.dart';
import 'package:payschool/widgets/form_login.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../providers/tutor_provider.dart';

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
        body: Consumer<TutorProvider>(
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
                              Consumer<TutorProvider>(
                                builder: (context, tutorProv, child) =>
                                     avatarProfile(),
                              ),
                              Consumer<TutorProvider>(
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
                            urlImage: 'assets/icons/correo.svg',
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
                            urlImage: 'assets/icons/telefono.svg',
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
                            urlImage: 'assets/icons/PagoM.svg',
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
                            urlImage: 'assets/icons/Contraseña.svg',
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
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('No')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const LoginPage(),
                                                  ));
                                            },
                                            child: const Text('Sí')),
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

