import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/widgets/text_section.dart';
import '../core/enties/service.dart';
import '../widgets/custom_button.dart';
import '../widgets/image_section.dart';
import '../widgets/subtitle_section.dart';

class LayaoutService extends StatefulWidget {
  final Service service;

  const LayaoutService({super.key, required this.service});

  @override
  State<LayaoutService> createState() => _LayaoutServiceState();
}

class _LayaoutServiceState extends State<LayaoutService> {
  String selectedPaymentMethod = "Paypal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.greyLight,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.service.name),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageSection(imageList: widget.service.urlImagenes),
                SubtitleSection(
                  subtitle: "\$${widget.service.cost}/mes",
                  fontsize: 24,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: TextSection(
                    text: widget.service.description,
                    fontSize: 15,
                    color: AppColors.greyDark,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                horizontal: 150,
                vertical: 14,
                text: "Solicitar",
                function: () {
                  displayDialog(context);
                },
                fontsize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void chooseStudent(BuildContext context) {
    List<String> alumnos = [
      "Juan",
      "Pedro",
    ];
    List<String> selectedAlumnos = [];
    bool canAsignar = false;

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
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
                        child: const Text("Asignar servicio a:",
                            textAlign: TextAlign.left),
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (_, __) => const Divider(),
                          itemCount: alumnos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CheckboxListTile(
                              title: Text(alumnos[index]),
                              value: selectedAlumnos.contains(alumnos[index]),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value != null && value) {
                                    selectedAlumnos.add(alumnos[index]);
                                  } else {
                                    selectedAlumnos.remove(alumnos[index]);
                                  }
                                  canAsignar = selectedAlumnos.isNotEmpty;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.primary),
                                padding:
                                    MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            onPressed: canAsignar
                                ? () {
                                    alertConfirm(context);
                                  }
                                : null,
                            child: const Text(
                              'Asignar',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  alertConfirm(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¿Está seguro?"),
          content: const Text(
              "¿Desea asignar el servicio a los alumnos seleccionados?"),
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
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
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
                      chooseStudent(context);
                    },
                    child: const Text(
                      'Elegir alumno',
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
