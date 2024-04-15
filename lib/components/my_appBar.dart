import 'package:flutter/material.dart';
import 'package:pet_care_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            themeProvider.toggleTheme();
          },
          icon: Icon(themeProvider.iconData), //icon switching
        ),
        actions: [
          const Text(
            'Pet',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          themeProvider.image, //image switching,  //image Swithching
          const Text(
            'Care',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.2,
            // color: Colors.blue,
            alignment: Alignment.centerRight,
            // color: Colors.white,
            child: IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.notifications, size: 30)),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
