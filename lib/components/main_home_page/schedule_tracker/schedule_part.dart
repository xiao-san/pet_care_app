import 'package:flutter/material.dart';

import 'schedule_pages/schedule_page1.dart';
import 'schedule_pages/schedule_page2.dart';
import 'schedule_pages/schedule_page3.dart';
import 'schedule_pages/schedule_page4.dart';
import 'schedule_pages/schedule_page5.dart';
import 'schedule_pages/schedule_page6.dart';

class SchedulePart extends StatefulWidget {
  const SchedulePart({super.key});

  @override
  State<SchedulePart> createState() => _SchedulePartState();
}

class _SchedulePartState extends State<SchedulePart> {
  List<String> scheduleNames = [
    'Vaccination',
    'Medication',
    'Vet Visit',
    'Care',
    'Symptoms',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 3;
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 375) {
       crossAxisCount = 4;
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: GridView.builder(
        itemCount: 6,
        //  padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SchedulePage1()));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SchedulePage2()));
                } else if (index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SchedulePage3()));
                } else if (index == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SchedulePage4()));
                } else if (index == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SchedulePage5()));
                } else if (index == 5) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SchedulePage6()));
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                height: 80,
                width: 80,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/scheduleimg/${index + 1}.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(scheduleNames[index]),
          ],
        ),
      ),
    );
  }
}
