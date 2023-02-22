import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hola_mundo/Lists/options.dart';



class ListOpcions extends StatelessWidget {
  const ListOpcions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: optionsList.length,
        itemBuilder: (context, index) {
          Options optionS = optionsList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(
                optionS.title,
                style: const TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                optionS.description,
                style: const TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              leading: SvgPicture.asset(
                optionS.imageUrl,
                height: 60,
                width: 60,
              ),
              trailing: SvgPicture.asset(
                'assets/Icons/backArrow.svg',
                height: 20,
                width: 20,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => optionS.page));
              },
            ),
          )

          );
        },
      ),
    );
  }
}
