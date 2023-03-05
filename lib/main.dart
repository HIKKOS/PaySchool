import 'package:flutter/material.dart';
import 'package:hola_mundo/data/providers/services_provider.dart';
import 'package:hola_mundo/widgets/NavbarAlfa.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesProvider = ServicesProvider();
    return ChangeNotifierProvider(
      create: (context) => servicesProvider,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: NavBar(),
      ),
    );
  }
}

//  Image.network(
//                 'https://rest-server-node-production-109d.up.railway.app/api/uploads/18763168-815f-4c7f-9d48-2f3f723f781b/89cf11cd-d00e-4ae5-b337-2251aedba5c8',
//                 headers: {"x-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjE1MjNmMGZhLTJlMTYtNDM2Zi1iMzg2LWRhNjU4M2U5N2NjNiIsInJvbCI6IlR1dG9yIiwiaWF0IjoxNjc3NjMwODAzLCJleHAiOjE2Nzc3MTcyMDN9.qEMg596rhHawIHd2de-w1VVUqHHW9TjZ7gGFi3qmr50"} ,
//                 ))
