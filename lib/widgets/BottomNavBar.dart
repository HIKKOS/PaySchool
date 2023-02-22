import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/pages/Home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int indexScreen = 0;

  final screens = [
    const HomePage(),
    const Center(child: Text("Search", style: TextStyle(fontSize: 45))),
    const Center(child: Text("Profile", style: TextStyle(fontSize: 45))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexScreen],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            selectedIndex: indexScreen,
            onTabChange: (index) => {setState(() => indexScreen = index)},
            gap: 8,
            backgroundColor: Colors.white60,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            activeColor: Colors.white,
            tabBackgroundColor: AppColors.primary,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Inicio",
              ),
              GButton(
                icon: Icons.search,
                text: "Servicios",
              ),
              GButton(
                icon: Icons.person,
                text: "Prefil",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
