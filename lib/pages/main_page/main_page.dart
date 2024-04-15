import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pet_care_app/components/my_appbar.dart';
import 'package:pet_care_app/pages/main_page/nav_pages/main_home_page.dart';
import 'package:pet_care_app/pages/main_page/nav_pages/profile_page.dart';
import 'package:pet_care_app/pages/main_page/nav_pages/record_page.dart';
import 'package:pet_care_app/pages/main_page/nav_pages/settings_page.dart';

   int selectedIndex = 0;
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  final navPages =const  [
    MainHomePage(),
    RecordPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: Colors.blue,
      body: navPages[selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.grey.shade300,
          // height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: Colors.grey.shade300,
              tabBackgroundColor: Colors.deepPurple.shade200,
              gap:8,
              padding: const EdgeInsets.all(16),
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',

                ),
                // GButton(
                //   icon: Icons.location_on_outlined,
                //    text: 'Locations',
                // ),
                GButton(
                  icon: Icons.bar_chart_sharp,
                  text: 'Report',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
            ),
          ),
        ),
    );
  }
}