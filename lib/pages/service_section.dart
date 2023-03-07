import 'package:flutter/material.dart';
import 'package:payschool/data/providers/services_provider.dart';
import 'package:payschool/domain/repositories/response/services_response_dto.dart';
import 'package:payschool/pages/global/app_colors.dart';
import 'package:payschool/pages/dialogs/dialogs.dart';
import 'package:payschool/widgets/text_section.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/image_section.dart';
import '../widgets/subtitle_section.dart';

class LayaoutService extends StatefulWidget {
  final String idService;
  final dynamic? service;

  const LayaoutService({super.key, required this.idService, this.service});

  @override
  State<LayaoutService> createState() => _LayaoutServiceState();
}

class _LayaoutServiceState extends State<LayaoutService> {
  List<String> imageList = [];
  @override
  void initState() {
    super.initState();
    final serviceProvider = ServicesProvider();

    Provider.of<ServicesProvider>(context, listen: false)
        .getServicesById('${widget.idService}');

    for (var i = 0; i < widget.service?.ImgPaths.length; i++) {
      String idImage =
          widget.service?.ImgPaths.isEmpty ? '' : widget.service?.ImgPaths[i];

      serviceProvider
          .getImagen('${widget.service?.id}', '${idImage}')
          .then((urlImage) {
        setState(() {
          imageList.add(urlImage);
        });
      });
    }
  }

  String selectedPaymentMethod = "Paypal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.greyLight,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Consumer<ServicesProvider>(builder: (context, value, child) {
          return Text("${value.service?.nombre}");
        }),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Consumer<ServicesProvider>(
              builder: (context, serviceProvider, child) => serviceProvider
                      .isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        widget.service?.ImgPaths.isEmpty
                            ? Image.asset('assets/images/no-image.jpg')
                            : ImageSection(imageList: imageList),
                        SubtitleSection(
                          subtitle: "\$${serviceProvider.service?.costo}/mes",
                          fontsize: 24,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: TextSection(
                            text: "${serviceProvider.service?.descripcion}",
                            fontSize: 15,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                horizontal: 150,
                vertical: 14,
                text: "Solicitar",
                function: () {
                  Dialogs().displayDialog(context);
                },
                fontsize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
