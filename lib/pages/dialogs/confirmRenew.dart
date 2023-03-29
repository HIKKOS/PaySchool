import 'package:flutter/material.dart';
import 'package:payschool/data/providers/services_provider.dart';
import 'package:payschool/pages/pay_detail.dart';

import '../../widgets/custom_button.dart';

final serviceProvider = ServicesProvider();

class DialogRenew {
  alertConfirm(BuildContext context, String nombre, String alumno,
      String idService, String? idAlumno) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¿Está seguro?"),
          content: Text("Se renovará el servicio $nombre a $alumno"),
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
                      Navigator.pop(context);
                      serviceProvider.renovarServicio(idService, idAlumno);
                    },
                    text: "Renovar",
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
