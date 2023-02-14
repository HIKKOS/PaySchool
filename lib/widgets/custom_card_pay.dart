import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class customCardPay extends StatelessWidget {
  final String title;
  final String icon;
  
  const customCardPay({
    Key? key, required this.title, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  icon,
                  height: 60,
                  width: 60,
                ),
              ),
              Container(
                  width: 280,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          title,
                          style:
                              const TextStyle(color: Color(0xFF616161), fontSize: 18),
                        ),
                        
                      ],
                    ),
                  )),
              ],
            
          ),
        ),
      ),
    );
  }
}
