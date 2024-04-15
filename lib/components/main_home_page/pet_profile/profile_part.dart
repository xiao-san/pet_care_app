import 'package:flutter/material.dart';

class ProfilePart extends StatelessWidget {
  const ProfilePart({super.key,});

  // final String imagePath;

  @override
  Widget build(BuildContext context) {

    void showProfilePage() {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: 700,
        ),
      );
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10),
        height: 150,
        color: Colors.grey.shade200,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Image.asset(
                'assets/intro_images/4.png',
                height: 50,
                width: 50,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            const Text('Puppy'),
            IconButton(
                onPressed:showProfilePage,
                icon: const Icon(Icons.arrow_downward)),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
