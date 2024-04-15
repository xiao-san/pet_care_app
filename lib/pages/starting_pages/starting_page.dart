import 'package:flutter/material.dart';
import 'package:pet_care_app/pages/starting_pages/login_pages/login_page.dart';
import 'package:pet_care_app/pages/starting_pages/welcome_page.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Welcome to Pet Care!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 10),
          const Text(
            'Make Your Pet Healthy and Vaccinate',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Image.asset("assets/front.png"),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const WelcomePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 131, 94, 195),
            ),
            child: const Text('Get Started'),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (builder) =>  const LoginPage()));
            }, // Implement functionality or remove button
            style: OutlinedButton.styleFrom(
              
              shape: LinearBorder.none,
            ),
           child: const Text('Login'),

          ),
        ],
      ),
    );
  }
}