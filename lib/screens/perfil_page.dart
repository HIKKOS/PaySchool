import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/Options/list_options.dart';
import 'package:hola_mundo/widgets/profile.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor : Colors.white,
        title: const Align(
          alignment: Alignment.center,
          child:  Text('Noe Moises Paredes rosado',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 , color:  Colors.blue,
          ),
          ),
        ),
        elevation: 0,
      ),
        backgroundColor: Colors.white60,
        body:  Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 15),
              child: UserProfile(),
              ),
              TextButton(onPressed: (){} ,
               child: const Text('Editar',
               style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color : Colors.blue
                ),
               )
               ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  height: 800,
                  width: 800,
                  color: Colors.white,
                  child: const ListOpcions(),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const TextButton(
                onPressed: null, 
                child: Text('Cerrar Sesión',
               style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color : Colors.blue
                  ),
                )
               )
            ],
          ),
        )
        );
  }
}
