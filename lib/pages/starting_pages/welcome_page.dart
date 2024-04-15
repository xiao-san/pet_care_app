import 'package:flutter/material.dart';
import 'package:pet_care_app/pages/starting_pages/intro_pages/page1.dart';
import 'package:pet_care_app/pages/starting_pages/intro_pages/page2.dart';
import 'package:pet_care_app/pages/starting_pages/intro_pages/page3.dart';
import 'package:pet_care_app/pages/starting_pages/login_pages/login_page.dart';
import 'package:pet_care_app/pages/starting_pages/pet_details/pet_input.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
      final controller = PageController();

    return Scaffold(
      // appBar:const MyAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: PageView(
              controller: controller,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const JumpingDotEffect(
              activeDotColor: Colors.deepPurple,
              // dotHeight: 20,
              // dotWidth: 20,
              spacing: 18,
              jumpScale: 3,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder)=> const PetInput()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 131, 94, 195),
            ),
            child: const Text("let's go"),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already Signed up?'),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) =>const LoginPage()));
                },
                child:const Text(
                  'Log in',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}