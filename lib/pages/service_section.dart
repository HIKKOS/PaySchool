import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/pages/dialogs/dialog.dart';
import 'package:hola_mundo/widgets/text_section.dart';
import '../core/enties/service.dart';
import '../widgets/custom_button.dart';
import '../widgets/image_section.dart';
import '../widgets/subtitle_section.dart';

class LayaoutService extends StatefulWidget {
  final Service service;

  const LayaoutService({super.key, required this.service});

  @override
  State<LayaoutService> createState() => _LayaoutServiceState();
}

class _LayaoutServiceState extends State<LayaoutService> {
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
        title: Text(widget.service.name),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageSection(imageList: widget.service.urlImagenes),
                SubtitleSection(
                  subtitle: "\$${widget.service.cost}/mes",
                  fontsize: 24,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: TextSection(
                    text: widget.service.description,
                    fontSize: 15,
                    color: AppColors.greyDark,
                  ),
                ),
              ],
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
