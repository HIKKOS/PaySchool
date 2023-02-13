import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/OpcionesUsuario/cambio_Correo.dart';
import 'package:hola_mundo/widgets/profile.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,    
      body: ListView(
        children: const [
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: UserProfile(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Align(
              child: Text(
                'Noe Paredes Rosado',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF176BFC)
                ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CambioCorreo(),
            )
        ],

      ),

    );
  }
}
