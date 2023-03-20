import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardOptions extends StatelessWidget {
  const CardOptions({
    Key? key,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.page
    }
    ) : super(key: key);

  final String title;
  final String description;
  final String urlImage;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric( vertical:8 ),
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  description,
                  style: const TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 16,
                         ),
                ),
                leading: SvgPicture.asset(
                  urlImage,
                  height: 60,
                  width: 60,
                ),
                trailing: SvgPicture.asset(
                  'assets/icons/backArrow.svg',
                  height: 20,
                  width: 20,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => page));
                },
              ),
            ),

          );
  }
}
