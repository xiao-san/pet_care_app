import 'package:flutter/material.dart';
import 'package:pet_care_app/pages/main_page/main_page.dart';
import 'package:pet_care_app/pages/starting_pages/pet_details/pet_input.dart';
// import 'package:pet_care_app/pages/start_pages/pet_details/pet_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginVerification() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing early
        builder: (context) => AlertDialog(
          title: const Text('Cann\'t Login !'),
          content: const Text("Please enter email and password"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) => const MainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Log in to your account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(bottom: 10),
              child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 48),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Forgot Your Password',
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
                loginVerification();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white),
              child: const Text('Log in'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const PetInput()));
                    },
                    child: const Text('Sign up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
