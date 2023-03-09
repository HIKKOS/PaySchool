import 'package:flutter/material.dart';
import 'package:payschool/pages/service_section.dart';
import 'package:payschool/widgets/image_section.dart';

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
  List<String> imageList = [];
  final servicesProvider = ServicesProvider();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < widget.service?.ImgPaths.length; i++) {
      String idImage =
          widget.service?.ImgPaths.isEmpty ? '' : widget.service?.ImgPaths[i];

      servicesProvider
          .getImagen('${widget.service?.id}', '${idImage}')
          .then((urlImage) {
        setState(() {
          imageList.add(urlImage);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return createListTileItem(context, widget.service);
  }

  createListTileItem(BuildContext context, dynamic service) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LayaoutService(
                      service: service,
                      idService: '${service?.id}',
                      imageList: imageList,
                    )));
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
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                      )),
                  //   image: DecorationImage(
                  //     image: NetworkImage(
                  //       service.ImgPaths.isEmpty ?
                  //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUrgu4a7W_OM8LmAuN7Prk8dzWXm7PVB_FmA&usqp=CAU'
                  //      : '${servicesProvider.baseUrl}/uploads/${service?.id}/${service.ImgPaths[0]}'
                  //     ),
                  //     fit: service.ImgPaths.isEmpty ? BoxFit.contain : BoxFit.cover,
                  //   ),
                  // )
                  child: service.ImgPaths.isEmpty
                      ? Image.asset('assets/images/no-image.jpg')
                      : ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child:
                              ImageSection(imageList: imageList, height: 150),
                        ),
                )),
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
                                  builder: (context) => LayaoutService(
                                        service: service,
                                        idService: '${service?.id}',
                                        imageList: imageList,
                                      )));
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
}
