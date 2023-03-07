import 'package:flutter/material.dart';

import '../global/app_colors.dart';
import '../../widgets/custom_button.dart';

class Dialogs {

  alertConfirm(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¿Está seguro?"),
          content: const Text(
              "¿Desea asignar el servicio a alumo"),
          actions: [
            Center(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar"),
                  ),
                  CustomButton(
                    horizontal: 20,
                    vertical: 10,
                    function: () {
                      // Aquí se realiza la asignación del servicio a los alumnos seleccionados
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    text: "Asignar",
                    fontsize: 15,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void displayDialog(BuildContext context) {
    String selectedPaymentMethod = "Paypal";
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.greyLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child:
                        const Text("Pagar con...", textAlign: TextAlign.left),
                  ),
                  RadioListTile(
                    value: "Paypal",
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                     
                    },
                    title: Row(
                      children: const [
                        Icon(Icons.paypal),
                        SizedBox(width: 10),
                        Text("Paypal")
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      alertConfirm(context);
                    },
                    child: const Text(
                      'Solicitar',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}


  // void chooseStudent(BuildContext context) {
  //   List<String> alumnos = [
  //     "Juan",
  //     "Pedro",
  //   ];
  //   List<String> selectedAlumnos = [];
  //   bool canAsignar = false;

  //   showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return StatefulBuilder(
  //           builder: (BuildContext context, StateSetter setState) {
  //             return SizedBox(
  //               height: MediaQuery.of(context).size.height * 0.3,
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                   color: AppColors.greyLight,
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(20),
  //                     topRight: Radius.circular(20),
  //                   ),
  //                 ),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Container(
  //                       padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
  //                       child: const Text("Asignar servicio a:",
  //                           textAlign: TextAlign.left),
  //                     ),
  //                     Expanded(
  //                       child: ListView.separated(
  //                         separatorBuilder: (_, __) => const Divider(),
  //                         itemCount: alumnos.length,
  //                         itemBuilder: (BuildContext context, int index) {
  //                           return CheckboxListTile(
  //                             title: Text(alumnos[index]),
  //                             value: selectedAlumnos.contains(alumnos[index]),
  //                             onChanged: (bool? value) {
  //                               setState(() {
  //                                 if (value != null && value) {
  //                                   selectedAlumnos.add(alumnos[index]);
  //                                 } else {
  //                                   selectedAlumnos.remove(alumnos[index]);
  //                                 }
  //                                 canAsignar = selectedAlumnos.isNotEmpty;
  //                               });
  //                             },
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                     ButtonBar(
  //                       alignment: MainAxisAlignment.center,
  //                       children: [
  //                         TextButton(
  //                           onPressed: () => Navigator.pop(context),
  //                           child: const Text(
  //                             'Cancelar',
  //                             style: TextStyle(
  //                               color: AppColors.primary,
  //                             ),
  //                           ),
  //                         ),
  //                         ElevatedButton(
  //                           style: ButtonStyle(
  //                               backgroundColor:
  //                                   MaterialStateProperty.all<Color>(
  //                                       AppColors.primary),
  //                               padding: MaterialStateProperty.all<EdgeInsets>(
  //                                   const EdgeInsets.symmetric(
  //                                       horizontal: 20, vertical: 10)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(30)))),
  //                           onPressed: canAsignar
  //                               ? () {
  //                                   alertConfirm(context);
  //                                 }
  //                               : null,
  //                           child: const Text(
  //                             'Asignar',
  //                             style: TextStyle(
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       });
  // }
