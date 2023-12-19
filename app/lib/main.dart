import 'package:app/constants/palette.dart';
import 'package:app/pages/home_screen.dart';
import 'package:app/pages/my_favourites_screen.dart';
import 'package:app/pages/my_profile_screen.dart';
import 'package:app/pages/my_reservations_screen.dart';
import 'package:app/pages/my_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<String> navigationHeaders = [
    "Anasayfa",
    "Rezervasyonlarım",
    "Hizmetlerim",
    "Favorilerim",
    "Profilim"
  ];
  List<Widget> navigationItems = [
    const HomeScreen(),
    const MyReservationScreen(),
    const MyServicesScreen(),
    const MyFavouritesScreen(),
    const MyProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Inter'),
          home: Scaffold(
            backgroundColor: HexColor(background),
            appBar: AppBar(
              title: Text(
                navigationHeaders[_selectedIndex],
              ),
            ),
            body: navigationItems.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Anasayfa'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.access_time_filled_rounded),
                    label: 'Rezervasyonlarım'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.monetization_on_rounded),
                    label: 'Hizmetlerim'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorilerim'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profilim')
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: HexColor(primary),
              unselectedItemColor: HexColor(dark),
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          )),
    );
  }
}
