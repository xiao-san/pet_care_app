import 'package:flutter/material.dart';
import 'package:pet_care_app/pages/starting_pages/login_pages/signup_page.dart';
import 'package:pet_care_app/pages/starting_pages/pet_details/question_lists.dart';
import 'package:pet_care_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class PetInput extends StatefulWidget {
  const PetInput({super.key});

  @override
  State<PetInput> createState() => _PetInputState();
}

class _PetInputState extends State<PetInput> {
  var currentQuestionIndex = 0;
  List<String> answeredData = [];
  // List<Widget> imageList = [];

  // // validation of the code
  // bool nameEntered = false; // pet's name
  // bool typeEntered = true; //pet's type (dog or cat)
  // bool breedEntered = true; //pet's breed

//changing question index--
  void changeQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
    //Return
  }

// Adding Answer to the asweredList--
  void addAnswers(String answer) {
    // print(selectedPetType); // Check if selectedPetType is printed correctly
    setState(() {
      if (currentQuestionIndex == 0) {
        answeredData.add(answer);
      } else if (currentQuestionIndex == 1) {
        print('Adding selectedPetType to answeredData: $selectedPetType');
        answeredData.add(selectedPetType);
      } else if (currentQuestionIndex == 2 && selectedPetType == "Cat") {
        answeredData.add(selectedCatBreed);
      } else if (currentQuestionIndex == 2 && selectedPetType == "Dog") {
        answeredData.add(selectedDogBreed);
      } else if (currentQuestionIndex == 3) {
        print('Upload an image');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //getting the CurrentQuestion data as question[index] ---> (String, Widget)--->>>>>>>
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          icon: Icon(
              Provider.of<ThemeProvider>(context).iconData), //icon switching
        ),
        actions: [
          const Text(
            'Pet',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Provider.of<ThemeProvider>(context).image, //image Swithching
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            currentQuestion.answerField,
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                //adding TextField controllerName Data to the addAnswers List--->
                String answer = controllerName.text;
                if (currentQuestionIndex == 0 && answer.isNotEmpty) {
                  addAnswers(answer);
                  changeQuestion();
                  print(answeredData);
                } else if (currentQuestionIndex == 1 &&
                    selectedPetType.isNotEmpty) {
                  addAnswers(selectedPetType);
                  changeQuestion();
                  print(answeredData);
                } else if (currentQuestionIndex == 2 &&
                    selectedCatBreed != "") {
                  addAnswers(selectedCatBreed);
                  changeQuestion();
                  print(answeredData);
                } else if (currentQuestionIndex == 2 &&
                    selectedDogBreed != "") {
                  addAnswers(selectedDogBreed);
                  changeQuestion();
                  print(answeredData);
                } else if (currentQuestionIndex == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SignupPage()));
                } else {
                  // Showing an error message by handlimg the validation error
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter the required information."),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 131, 94, 195),
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
