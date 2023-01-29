import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';

class ImageSection extends StatefulWidget {
  const ImageSection({super.key, required this.imageList});
  final List<String> imageList;

  @override
  _ImagenSectionState createState() => _ImagenSectionState();
}

class _ImagenSectionState extends State<ImageSection> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
                items: widget.imageList
                    .map((path) => FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.gif',
                          image: path,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: false,
                aspectRatio: 1,
                viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),

            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? AppColors.primary
                            : AppColors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
