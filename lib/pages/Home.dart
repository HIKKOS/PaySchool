import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/widgets/Card_Beneficiario.dart';
import 'package:hola_mundo/widgets/ServicioHome.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
        backgroundColor: const Color(0xFFEDF2F8),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFEDF2F8),
          title: const CustomAppBar(text: 'Hola, Noe Paredes'),
        ),
        body: Center(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                //!cambiar
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 200.0,
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(
                        currentIndicatorColor: AppColors.primary,
                        indicatorBackgroundColor: AppColors.greyDark),
                  ),
                  items: [1, 2].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return const CardBeneficiario();
                      },
                    );
                  }).toList(),
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
                SizedBox(
                  height: 400,
                  width: width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const CustomCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Color(0xFF176BFC), fontSize: 24),
      ),
    );
  }
}
