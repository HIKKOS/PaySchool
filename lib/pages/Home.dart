import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/Card_Beneficiario.dart';
import 'package:hola_mundo/widgets/ServicioHome.dart';
import 'package:hola_mundo/widgets/navbarAlfa.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
          backgroundColor: Color(0xFFEDF2F8),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFEDF2F8),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Hola, Noe Paredes',
                textAlign: TextAlign.left,
                style: TextStyle(color: Color(0xFF176BFC), fontSize: 24),
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CardBeneficiario(),
                ),
                Row(
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
                ),
                ServicioHome(),
                ServicioHome(),
              ],
            ),
          ),
          bottomNavigationBar: NavbarAlfa()),
    );
  }
}
