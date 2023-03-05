import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hola_mundo/domain/repositories/response/services_response_dto.dart';
import 'package:hola_mundo/pages/service_section.dart';
import 'package:hola_mundo/widgets/custom_button.dart';

import '../data/providers/services_provider.dart';
import '../pages/global/app_colors.dart';

class CardItemService extends StatefulWidget {
  final dynamic? service;
  final String icon;
  const CardItemService({super.key, required this.service, required this.icon});

  @override
  State<CardItemService> createState() => _CardItemServiceState();
}

class _CardItemServiceState extends State<CardItemService> {
  final servicesProvider = ServicesProvider();
  @override
  Widget build(BuildContext context) {
    return createListTileItem(context, widget.service);
  }

  createListTileItem(BuildContext context, dynamic service) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LayaoutService(service: service,idService: '${service?.id}')));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 150,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      service.ImgPaths.isEmpty ?
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHOpPfD2XOtLdPU3k61PGUbu-GTxhRXL5vQawcUIUXo092fwAs'
                     : '${servicesProvider.baseUrl}/uploads/${service?.id}/${service.ImgPaths[0]}'  
                    ),
                    fit: service.ImgPaths.isEmpty ? BoxFit.contain : BoxFit.cover  ,
                  ),
                ))),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${service?.nombre}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$${service?.costo}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primary),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LayaoutService(service: service, idService: '${service?.id}')));
                        },
                        child: Text('Ver más'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));

  // Container createTrailinItem(ServiceResponseDto? service) {
  //   return Container(
  //     width: 80,
  //     height: 80,
  //     // decoration: const BoxDecoration(
  //     //   color: AppColors.primary,
  //     //   shape: BoxShape.circle,
  //     // ),
  //     child: imageIcon(service),
  //   );
  // }

  // FadeInImage imageIcon(ServiceResponseDto? service) {
  //   return FadeInImage.assetNetwork(
  //     placeholder: 'assets/images/loading.gif',
  //     image:
  //         'http://192.168.137.61:8080/api/uploads/${service?.nombre}/${service?.ImgPaths[0]}',
  //     fit: BoxFit.contain,
  //   );
  // }

// getUrlicon(service?.nombre, '${service?.id}')
}

// SvgPicture.asset(
        //   service.urlIcon,
        //   height: 60,
        //   width: 60,
        // )

        // 'assets/images/no-image.jpg'


      // ListTile(
        
      //   leading: Image.asset(
      //     'assets/images/no-image.jpg',
      //     height: 60,
      //     width: 60,
      //   ),
      //   title: Text("${service?.nombre}",
      //       style: const TextStyle(color: AppColors.greyDark, fontSize: 20)),
      //   subtitle: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 5),
      //     child: Text(
      //       "\$${service?.costo}",
      //       style: TextStyle(color: AppColors.greyMedium, fontSize: 18),
      //     ),
      //   ),
      //   trailing: SvgPicture.asset(
      //     widget.icon,
      //     height: 20,
      //     width: 20,
      //   ),
      //   onTap: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => LayaoutService(service: service)));
      //   },
      //   //
      // );