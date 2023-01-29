import 'package:flutter/material.dart';

class CardMetodoPago extends StatelessWidget {
  const CardMetodoPago({
    Key? key,
    required bool cardVisible,
  }) : _cardVisible = cardVisible, super(key: key);

  final bool _cardVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _cardVisible,
      child: const Card(
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Center(
            child: Text("Tarjeta"),
          ),
        ),
      ),
    );
  }
}