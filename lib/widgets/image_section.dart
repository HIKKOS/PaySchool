import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payschool/data/providers/services_provider.dart';
import 'package:payschool/data/repositories/app_colors.dart';

class ImageSection extends StatefulWidget {
  const ImageSection({super.key, required this.imageList, required this.height});
  final List<dynamic> imageList;
  final double height;

  @override
  _ImagenSectionState createState() => _ImagenSectionState();
}

class _ImagenSectionState extends State<ImageSection> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  final servicesProvider = ServicesProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              //  FadeInImage.assetNetwork(
              //             placeholder: 'assets/images/loading.gif',
              //             image: path,
              //             fit: BoxFit.cover,
              //           ))
              items: widget.imageList
                  .map((path) => Image.network(
                        path,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        // headers: {"x-token": "${servicesProvider.token}"},
                      ))
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                // scrollPhysics: const BouncingScrollPhysics(),
                // autoPlay: false,
                // aspectRatio: 1,
                // viewportFraction: 1,
                height: widget.height,
                aspectRatio: 1,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: widget.imageList.length  == 1 ? false : true,
                autoPlayInterval: Duration(seconds: 6),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child:  Container(
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
