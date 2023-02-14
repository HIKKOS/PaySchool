import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
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
                  color: AppColors.primary, fontWeight: FontWeight.bold,
                ),
                TextSection(
                  text: widget.service.description,
                  fontSize: 15,
                  color: AppColors.greyDark,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 190.0),
                    child: CustomButton(
                        horizontal: 100,
                        vertical: 14,
                        text: "Solicitar",
                        function: () {
                          displayDialog(context);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void displayDialog(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.greyLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child:
                        const Text("Pagar con...", textAlign: TextAlign.left),
                  ),
                  RadioListTile(
                    value: "Paypal",
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                    title: Row(
                      children: const [
                        Icon(Icons.paypal),
                        SizedBox(width: 10),
                        Text("Paypal")
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Solicitar'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
