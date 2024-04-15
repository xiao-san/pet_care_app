import 'package:flutter/material.dart';
import 'package:pet_care_app/pages/starting_pages/starting_page.dart';
import 'package:pet_care_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          icon: Icon(Provider.of<ThemeProvider>(context).iconData), //icon switching
        ),
        
        actions: [
          const Text(
            'Pet',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Provider.of<ThemeProvider>(context).image,  //image Swithching
          const Text(
            'Care',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.2,
            // color: Colors.blue,
            alignment: Alignment.centerRight,
            // color: Colors.white,
            // child: IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.notifications, size: 30)),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,

      body: const StartingPage(),
    );
  }
}
