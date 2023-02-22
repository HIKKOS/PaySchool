import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/pages/catalog_service.dart';
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int indexScreen = 0;

  final screens = [
    const Center(child: Text("Home", style: TextStyle(fontSize: 45))),
    CatalogService(),
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
            backgroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            activeColor: AppColors.white,
            tabBackgroundColor: AppColors.primary,
            tabs: const [
              GButton(
                icon: Icons.home,
                iconColor: Colors.grey,
                text: "Home",
              ),
              GButton(
                icon: Icons.search,
                 iconColor: Colors.grey,
                text: "Search",
              ),
              GButton(
                icon: Icons.person,
                 iconColor: Colors.grey,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class NavbarAlfa extends StatelessWidget {
//   final bool isHomeSelected;
//   final bool isSearchSelected;
//   final bool isHistorySelected;
//   final bool isUserSelected;

//   NavbarAlfa({
//    super.key, required this.isHomeSelected, required this.isSearchSelected, required this.isHistorySelected, required this.isUserSelected
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 90,
//       child: Card(
//         elevation: 10,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               onPressed: () {
                
//               },
//               iconSize: 35,
//               icon: SvgPicture.asset(
//                 "assets/icons/home.svg",
//                 color: isHomeSelected ? Color(0xFF176BFC) : Color(0xFFD9D9D9),
//                 height: 35,
//               ),
//             ),
//             IconButton(
//               iconSize: 35,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CatalogService()),
//                 );
//               },
//               icon: SvgPicture.asset(
//                 "assets/icons/search.svg",
//                 color: isSearchSelected ? Color(0xFF176BFC) : Color(0xFFD9D9D9),
//                 height: 35,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PayHistory()),
//                 );
//               },
//               iconSize: 35,
//               icon: SvgPicture.asset(
//                 "assets/icons/history.svg",
//                 color: isHistorySelected ? Color(0xFF176BFC) : Color(0xFFD9D9D9),
//                 height: 35,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               iconSize: 35,
//               icon: SvgPicture.asset(
//                 "assets/icons/user.svg",
//                 color: isUserSelected ? Color(0xFF176BFC) : Color(0xFFD9D9D9),
//                 height: 35,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

