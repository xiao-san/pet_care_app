import 'package:flutter/material.dart';
import 'package:pet_care_app/pages/starting_pages/login_pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController unameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signupVerification() {
    if (unameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing early
        builder: (context) => AlertDialog(
          title: const Text('Cann\'t Signup!!!'),
          content: const Text("Please enter username, email and password"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Signup to your account',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 30, bottom: 30),
            child: TextField(
                controller: unameController,
                decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(bottom: 30),
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
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (builder)=> const PetName()));
              print(unameController.text);
              print(emailController.text);
              print(passwordController.text);
              signupVerification();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white),
            child: const Text('Sign up'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already logged in?",
                style: TextStyle(fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const LoginPage()));
                  },
                  child: const Text('Sign in'))
            ],
          )
        ],
      ),
    );
  }
}
