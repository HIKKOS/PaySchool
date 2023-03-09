import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payschool/data/providers/services_provider.dart';
import 'package:payschool/data/repositories/app_colors.dart';
import 'package:payschool/pages/dialogs/dialogs.dart';
import 'package:payschool/widgets/text_section.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/image_section.dart';
import '../widgets/subtitle_section.dart';

class LayaoutService extends StatefulWidget {
  final String idService;
  final dynamic? service;
  final List<String> imageList;

  const LayaoutService(
      {super.key,
      required this.idService,
      this.service,
      required this.imageList});

  @override
  State<LayaoutService> createState() => _LayaoutServiceState();
}

class _LayaoutServiceState extends State<LayaoutService> {
   bool appBarColor = true;

  @override
  void initState() {
    super.initState();
    final serviceProvider = ServicesProvider();

    Provider.of<ServicesProvider>(context, listen: false)
        .getServicesById('${widget.idService}');
  }

  String selectedPaymentMethod = "Paypal";

  void changeAppBarColor(bool value) {
    setState(() {
      appBarColor = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
            if (details.primaryDelta! > 10) {
              changeAppBarColor(true);
            } else if (details.primaryDelta! < -10) {
              changeAppBarColor(false);
            }
          },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.greyLight,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: appBarColor ? Color.fromRGBO(0, 0, 0, 0.5) : Colors.transparent,
          elevation: 0,
          title: Consumer<ServicesProvider>(builder: (context, value, child) {
            return Text( appBarColor ? "${value.service?.nombre}" : "");
          }),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Consumer<ServicesProvider>(
                builder: (context, serviceProvider, child) => serviceProvider
                        .isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.service?.ImgPaths.isEmpty
                              ? Image.asset('assets/images/no-image.jpg')
                              : ImageSection(
                                  imageList: widget.imageList,
                                  height: 400,
                                ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 10, top: 10, left: 23),
                                child: SvgPicture.asset(
                                  'assets/icons/service.svg', // ruta del archivo SVG
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 2, top: 10, left: 8),
                                  child: SubtitleSection(
                                    subtitle:
                                        "Servicio - ${serviceProvider.service?.nombre}",
                                    fontsize: 20,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Color(0xFFC1C7D1), height: 2),
                          Section(
                              title: "Costo",
                              subtitle:
                                  "\$${serviceProvider.service?.costo}/mes", icon: Icons.monetization_on_outlined,),
    
                          const Divider(color: Color(0xFFC1C7D1), height: 2),
                          Section(
                              title: "Descripción",
                              subtitle:
                                  "${serviceProvider.service?.descripcion}", icon: Icons.edit,),
    
                          const Divider(color: Color(0xFFC1C7D1), height: 2),
                          Section(
                              title: "Tipo de servicio",
                              subtitle:
                                  serviceProvider.service?.cancelable == true
                                      ? "Cancelable"
                                      : "No cancelable", icon: Icons.business,),
                          const Divider(color: Color(0xFFC1C7D1), height: 2),
                          // serviceProvider.service?.cancelable == true ? "Cancelable" : "No cancelable"
    
                          Section(
                              title: "Frecuencia de pago",
                              subtitle:
                                  "${serviceProvider.service?.frecuenciaDePago}", icon: Icons.calendar_today,),
    
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
              ),
            ),
            Consumer<ServicesProvider>(
                builder: (context, serviceProvider, child) => serviceProvider
                        .isLoading
                    ? const Center(child: CircularProgressIndicator()) :
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  horizontal: 150,
                  vertical: 14,
                  text: "Solicitar",
                  function: () {
                    Dialogs().displayDialog(context, serviceProvider.service, serviceProvider.horarios);
                  },
                  fontsize: 20,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

}

class Section extends StatelessWidget {
  const Section({super.key, required this.title, required this.subtitle, required this.icon});
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Padding(
              padding: EdgeInsets.only(bottom: 10, top: 10, left: 23),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 40,
              )),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SubtitleSection(
                  subtitle: title,
                  fontsize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 5),
                TextSection(
                  text: subtitle,
                  fontSize: 15,
                  color: AppColors.greyDark,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
