import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class SchedulePage1 extends StatefulWidget {
  const SchedulePage1({super.key});

  @override
  State<SchedulePage1> createState() => _SchedulePage1State();
}

class _SchedulePage1State extends State<SchedulePage1> {
  TextEditingController vaccineType = TextEditingController();
  TextEditingController noteController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 13);

//Date Picker
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

//Time Picker
  void _presentTimePicker() {
    final now = TimeOfDay.now();
    showTimePicker(
      context: context,
      initialTime: now,
    ).then((value) {
      setState(() {
        selectedTime = value!;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of TextEditingController objects
    vaccineType.dispose();
    noteController.dispose();
    super.dispose();
  }

  String selectedDogVaccine = "Rabies";
  String selectedCatVaccine = "Rabies";

  List<String> dogVaccines = [
    "Rabies",
    "Canine distemper",
    "Canine parvovirus",
    "Canine adenovirus type 1",
    "Canine adenovirus type 2",
    "Canine parainfluenza",
    "Leptospirosis",
    "Bordetella bronchiseptica",
    "Lyme disease",
    "Canine influenza",
  ];

  List<String> catVaccines = [
    "Rabies",
    "Feline viral rhinotracheitis ",
    "Feline calicivirus",
    "Feline panleukopenia",
    "Feline leukemia virus",
    "Feline immunodeficiency virus",
    "Chlamydophila felis",
  ];

  String?
      selectedVaccine; // Variable to store the selected vaccine (Making Global)

  void showVaccineType() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shadowColor: Colors.blueGrey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel_outlined),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // DOGS VACCINES ---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            const Text(
              'Dog Vaccines:',
              style: TextStyle(fontSize: 16.0),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Select a dog's vaccine",
                ),
                value: selectedDogVaccine,
                onChanged: (value) {
                  setState(() {
                    selectedDogVaccine = value!;
                    selectedVaccine = value; // Update selected vaccine

                    // vaccineType.text = value; // Update TextField directly

                    //To show the selected vaccine
                    showShortDialog(value);
                  });
                },
                items: dogVaccines.map((vaccine) {
                  return DropdownMenuItem(
                    value: vaccine,
                    child: Text(vaccine),
                  );
                }).toList(),
              ),
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),

            // CATS VACCINES ---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            const Text(
              'Cat Vaccines:',
              style: TextStyle(fontSize: 16.0),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Select a cat's vaccine",
                ),
                value: selectedCatVaccine,
                onChanged: (value) {
                  setState(() {
                    selectedCatVaccine = value!;
                    selectedVaccine = value; // Update selected vaccine

                    // vaccineType.text = value; // Update TextField directly
                    showShortDialog(value);
                  });
                },
                items: catVaccines.map((vaccine) {
                  return DropdownMenuItem(
                    value: vaccine,
                    child: Text(vaccine),
                  );
                }).toList(),
              ),
            ),

            // Save Button
            ElevatedButton(
                onPressed: () {
                  // Check if a vaccine is selected
                  if (selectedVaccine != null) {
                    vaccineType.text = selectedVaccine!;
                    print('Selected Vaccine: $selectedVaccine');
                  } else {
                    print('No vaccine selected.');
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  void showShortDialog(String selectedVaccineName) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing early
      builder: (context) => AlertDialog(
        title: const Text('Selected Vaccine'),
        content: Text("You've selected: $selectedVaccineName"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccination'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 10,),
              //fist circle Image
              const CircleAvatar(
                backgroundImage: AssetImage('assets/scheduleimg/1.png'),
                radius: 30,
              ),
              const SizedBox(
                height: 20,
              ),

              //Second Textfield For Vaccine Type
              SizedBox(
                width: 300,
                child: TextField(
                  controller: vaccineType,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Vaccination type',
                    suffixIcon: IconButton(
                        onPressed: () {
                          showVaccineType();
                        },
                        icon: const Icon(Icons.search)),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Third For Date Picker
              Container(
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select a Date"
                          : formatter.format(selectedDate!),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //Forth Fo Time Picker
              Container(
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedTime == TimeOfDay(hour: 8, minute: 13)
                          ? "Select a time"
                          : selectedTime.format(context).toString()
                      // selectedTime == null
                      //     ? "Select Schedule Time"
                      //     : formatterT.format(selectedTime),
                      ,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: _presentTimePicker,
                      icon: const Icon(Icons.access_time_outlined),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Notes
              SizedBox(
                width: 300,
                child: TextField(
                  controller: noteController,
                  keyboardType: TextInputType.multiline,
                  maxLength: 150,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Type notes.....',
                    suffixIcon: const Icon(Icons.note_alt_outlined),
                  ),
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    print(vaccineType.text);
                    print(formatter.format(selectedDate!));
                    // print(selectedTime.format(context).toString());
                    print(selectedTime.format(context).toString());
                    print(noteController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade400,  //----------->>>
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
