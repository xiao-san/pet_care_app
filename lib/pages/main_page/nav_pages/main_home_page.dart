import 'package:flutter/material.dart';
import 'package:pet_care_app/components/main_home_page/activity_tracker/activity_part.dart';
import 'package:pet_care_app/components/main_home_page/pet_profile/profile_part.dart';
import 'package:pet_care_app/components/main_home_page/schedule_tracker/schedule_part.dart';
import 'package:pet_care_app/components/main_home_page/weight_saver/weight_part.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: const [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //Profile
                ProfilePart(),

                //Activity log
                ActivityPart(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'Schedule Reminder',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 280,
            child: SchedulePart(),
          ),
          WeightPart(),
        ],
      ),
    );
  }
}
