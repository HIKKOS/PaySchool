// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hola_mundo/pages/perfil_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int indexScreen = 0;

  final screens = [
    const Center(child: Text("Home", style: TextStyle(fontSize: 45))),
    const Center(child: Text("Search", style: TextStyle(fontSize: 45))),
    const PerfilPage()
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
            activeColor: Colors.blue.shade800,
            tabBackgroundColor: Colors.blue.shade200,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
