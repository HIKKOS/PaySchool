import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AlertButton extends StatelessWidget {
  const AlertButton(
      {Key? key,
      required this.horizontal,
      required this.vertical,
      required this.titulo,
      required this.function,
      required this.contenido})
      : super(key: key);
  final double horizontal;
  final double vertical;
  final String titulo;
  final String contenido;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF176BFC)),
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80))),
      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          icon:SvgPicture.asset(
            'assets/Icons/Confirmation.svg',
            height: 30,
            width: 30,
            ),
          title: Text(titulo),
          content: Text(contenido),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  function();
                },
                style: const  ButtonStyle(
                  padding: MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                ),
                child:   const Text('ok',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 18
                  ),
                ),
                )
          ],
        ),
      ),
      child: const Text(
        'Confirmar',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      ),
    );
  }
}
