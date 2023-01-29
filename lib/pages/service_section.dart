import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/widgets/text_section.dart';
import '../core/enties/service.dart';
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
              children: [
                ImageSection(imageList: widget.service.urlImagenes),
                SubtitleSection(subtitle: "\$${widget.service.cost}/mes"),
                TextSection(text: widget.service.description),
                const SubtitleSection(subtitle: "Prioridad"),
                TextSection(text: widget.service.priority),
                ElevatedButton(
                  onPressed: () => displayDialog(context),
                  child: const Text("Solicitar"),
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
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: const Text("Pagar con..."),
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
                        SizedBox(
                            width: 10),
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
