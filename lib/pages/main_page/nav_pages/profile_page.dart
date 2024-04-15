import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_care_app/pages/starting_pages/pet_details/model/image_selector.dart';
import 'package:pet_care_app/pages/starting_pages/pet_details/question_lists.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String petName = controllerName.text;

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        pickedImage = pickedFile;
      }
    });
  }

  String petBreed() {
    if (selectedPetType == "Dog") {
      return selectedDogBreed;
    } else {
      return selectedCatBreed;
    }
  }



  TextEditingController newPetName = TextEditingController();

  void changePetName() {
    setState(() {
      petName = newPetName.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    void editPetName() {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.amberAccent,
          child: SizedBox(
            height: 160,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(
                        left: 30,
                        top: 20,
                        bottom: 20,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: newPetName,
                        decoration: const InputDecoration(
                          hintText: "Enter cat's name",
                        ),
                        // onTap: ,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      changePetName();
                    },
                    child: const Text('Save Name')),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(100),
              ),
              child: pickedImage == null
                  ?  SizedBox(
                      child: TextButton(
                  onPressed: () {
                    _getImage();
                  },
                  child: const Center(child: Text('Select')),
                ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        File(pickedImage!.path),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  petName.isEmpty ? 'Enter Pet Name' : petName,
                  style: const TextStyle(fontSize: 28),
                ),
                IconButton(
                    onPressed: () {
                      editPetName();
                    },
                    icon: const Icon(Icons.edit))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
