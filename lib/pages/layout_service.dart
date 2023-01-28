import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hola_mundo/data/repositories/service_repository.dart';

import '../core/enties/service.dart';

class LayaoutService extends StatelessWidget {
  final Service service;

  const LayaoutService({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text(service.name),
      ),
      body: Center(
        
      ),
    );
  }
}
