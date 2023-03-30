import 'package:flutter/material.dart';
import 'package:payschool/data/providers/services_provider.dart';
import 'package:payschool/widgets/text_section.dart';
import '../global/app_colors.dart';
import '../../widgets/custom_button.dart';

final serviceProvider = ServicesProvider();

class Dialogs {
  void displayDialog(BuildContext context, dynamic service,
      List<dynamic> horarios, dynamic alumno) {
    var selectedHorarios = [];
    bool canAsignar = false;
    int cantidad = 1;
    double elements = service.horarioServicio.length * 100.toDouble();
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height:
                    service.horarioServicio.isNotEmpty ? (250 + elements) : 250,
                decoration: const BoxDecoration(
                  color: AppColors.greyLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: const Text("Solicitar", textAlign: TextAlign.left),
                    ),
                    const ListTile(
                      leading: Icon(Icons.paypal),
                      title: Text("Paga con Paypal"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                         Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextSection(
                            text:  service.frecuenciaDePago == 'MENSUAL' ? 'Cantidad de meses a contratar' : 'Cantidad de semanas a contratar' ,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    cantidad--;
                                    if (cantidad < 1) {
                                      cantidad = 1;
                                    }
                                  });
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  cantidad.toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  service.frecuenciaDePago == 'MENSUAL' ?
                                  setState(() {
                                    
                                    if (cantidad <= 11) {
                                      cantidad++;
                                    }
                                  })
                                  :
                                    setState(() {
                                    if (cantidad <= 3) {
                                      cantidad++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    service.horarioServicio.isNotEmpty
                        ? const ListTile(
                            leading: Icon(Icons.access_time),
                            title: Text("Elija un horario de servicio"),
                          )
                        : const Center(),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: service.horarioServicio.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckboxListTile(
                            secondary: const Icon(Icons.calendar_today),
                            title: Text(horarios[index].dia),
                            subtitle: Text(
                                'Hora inicio: ${horarios[index].inicio} - Hora fin: ${horarios[index].fin} '),
                            value: selectedHorarios.contains(horarios[index]),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null && value) {
                                  selectedHorarios.add(horarios[index]);
                                } else {
                                  selectedHorarios.remove(horarios[index]);
                                }
                                canAsignar = selectedHorarios.isNotEmpty;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          onPressed:
                              service.horarioServicio.isNotEmpty && canAsignar
                                  ? () {
                                      Navigator.pop(context);
                                      alertConfirm(context, service, cantidad,
                                          selectedHorarios, alumno);
                                    }
                                  : service.horarioServicio.isEmpty
                                      ? () {
                                          Navigator.pop(context);
                                          alertConfirm(
                                              context,
                                              service,
                                              cantidad,
                                              selectedHorarios,
                                              alumno);
                                        }
                                      : null,
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
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  alertConfirm(BuildContext context, dynamic service, int vecesContratado,
      var horarios, dynamic alumno) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¿Está seguro?"),
          content: Text(
              "Se asignará el servicio ${service.nombre} a alumo ${alumno.primerNombre}"),
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
                      // Aquí se realiza la asignación del servicio a los dias seleccionados
                      Navigator.pop(context);
                       
                        serviceProvider.contratarServicio(
                        service.id,
                        alumno.id,
                        vecesContratado,
                        horarios,
                      );
                      
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
}
