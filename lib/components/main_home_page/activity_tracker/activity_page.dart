import 'package:flutter/material.dart';

import 'dart:async'; //This package is for Time.periodic -->

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  var now =
      DateTime.now(); //declaring now as a var (it is not constant variable)
  String selectedDate = "";

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) => setState(() {
              now = DateTime.now(); // Update now within setState

              var hour = now.hour; // Adjust for 12-hour format

              var minute = now.minute;
              var isPM = hour >= 12;

              var newHour = hour; // Don't subtract 1 initially
              if (hour > 12) {
                newHour = hour - 12;
              }
              selectedDate = '$newHour: $minute ${isPM ? 'PM' : 'AM'}';
            }));
  }

  //List of Activity
  List<String> activities = ['Ate', 'Drank', 'Walk', 'Sleep'];
  Set<String> selectedItems = {};

// Poop Count ------------------------->
  int countP = 0;
  void addPotty() {
    setState(() {
      countP++;
    });
  }

  void minusPotty() {
    setState(() {
      countP--;
    });
  }

// Pee count ------------------------->
  int countPee = 0;
  void addPee() {
    setState(() {
      countPee++;
    });
  }

  void minusPee() {
    setState(() {
      countPee--;
    });
  }

//----------------------------------->
  void showActivity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selected Items'),
          content: Text("${selectedItems.join(', ')}, Date: $selectedDate"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void showPottyData() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selected Items'),
            content: Text('Potty: $countP, Pee: $countPee'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

// A set to keep track of selected items  (it stores unique Elements No dublications)------------>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Activity Record Tracker'),
      ),
      body: Center(
        child: Column(
          children: [
            // //Topic /----------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>
            // const Padding(
            //   padding: EdgeInsets.only(bottom: 15),
            //   child: Text(
            //     'Daily Activity Record Tracker',
            //     style: TextStyle(fontSize: 24), // Use const for styles
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),

            //Date and TIme ----------------------->>>>>>>>>>>>>>>>>>>>>>>>>>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Date:'),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Today, ${now.day}/${now.month}/${now.year}',
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(selectedDate),
                ),
              ],
            ),

            // CheckBox Buttons ---------------------------------------------------->

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(top: 20),
              height: 255,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = activities[index];

                  //CheckBox
                  return CheckboxListTile(
                    title: Text(item),
                    secondary: Image.asset(
                      'assets/activityimg/${index + 1}.png',
                      width: 50,
                      height: 50,
                    ),
                    value: selectedItems.contains(item),
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          selectedItems.add(item);
                        } else {
                          selectedItems.remove(item);
                        }
                      });
                    },
                  );
                },
              ),
            ),

            // Showing selected items in a dialog------------->
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       title: Text('Selected Items'),
            //       content: Text(selectedItems.join(', ')),
            //       actions: <Widget>[
            //         TextButton(
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //           child: Text('Close'),
            //         ),
            //       ],
            //     );

            //Temp Button
            ElevatedButton(
              onPressed: () {
                showActivity();
              },
              child: const Text('SHOW'),
            ),

            //How many times did your pet go potty?
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                'Add Potty logs',
                style: TextStyle(fontSize: 24), // Use const for styles
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8),
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/activityimg/poop.png',
                        height: 45,
                        width: 45,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5)),
                      const Text('Potty'),
                      const Spacer(),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(5),
                  // padding: const EdgeInsets.all(20),
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/activityimg/pee.png',
                        height: 45,
                        width: 45,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5)),
                      const Text('Pee'),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  // padding: const EdgeInsets.all(20),
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (countP > 0) {
                              minusPotty();
                            }
                          },
                          icon: const Icon(Icons.remove),
                          // highlightColor: const Color.fromARGB(255, 97, 90, 90),
                          iconSize: 18,
                        ),
                        Text(
                          countP.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            if (countP < 20) {
                              addPotty();
                            }
                          },
                          icon: const Icon(Icons.add),
                          // highlightColor: Colors.red.shade200,
                          iconSize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  // padding: const EdgeInsets.all(20),
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (countPee > 0) {
                            minusPee();
                          }
                        },
                        icon: const Icon(Icons.remove),
                        // highlightColor: Colors.deepOrangeAccent,
                        iconSize: 18,
                      ),
                      Text(
                        countPee.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          if (countPee < 20) {
                            addPee();
                          }
                        },
                        icon: const Icon(Icons.add),
                        // highlightColor: Colors.red.shade200,
                        iconSize: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showPottyData();
              },
              child: const Text('Save Potty'),
            ),
          ],
        ),
      ),
    );
  }
}
