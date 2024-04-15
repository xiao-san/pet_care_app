import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class SchedulePage6 extends StatefulWidget {
  const SchedulePage6({super.key});

  @override
  State<SchedulePage6> createState() => _SchedulePage6State();
}

class _SchedulePage6State extends State<SchedulePage6> {

  TextEditingController otherController = TextEditingController();
  TextEditingController otherNoteController = TextEditingController();

  DateTime? _selectedDate6;

  TimeOfDay? _selectedTime6;

  // Boolean flag to check if widget is mounted
  // bool _isMounted = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _isMounted = true;
  // }

  // @override
  // void dispose() {
  //   _isMounted = false; // Set to false when widget is disposed
  //   super.dispose();
  // }

//Cureent Date Picking
  void currentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    DateTime? pickedDate;

    pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate6 = pickedDate;
    });
  }

//Current Time Picking
  void currentTimePicker() async {
    final now = TimeOfDay.now();
    TimeOfDay? pickedTime;

    pickedTime = await showTimePicker(
      context: context,
      initialTime: now,
    );

    setState(() {
      _selectedTime6 = pickedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

            const SizedBox(height: 10,),

              //fist circle Image
              const CircleAvatar(
                backgroundImage: AssetImage('assets/scheduleimg/6.png'),
                radius: 30,
              ),
              const SizedBox(
                height: 20,
              ),

              //Second Textfield For Vaccine Type
              SizedBox(
                width: 300,
                child: TextField(
                  controller: otherController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter other',
                  ),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('Date & Time:'),
              //     TextButton(
              //       onPressed: () {
              //         _selectDateTime();
              //       },
              //       child: Text(_selectedDateTime?.toString() ?? 'Select'),
              //     ),
              //   ],
              // ),

              //Date Picker

              const SizedBox(
                height: 20,
              ),
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
                      _selectedDate6 == null
                          ? "Select a Date"
                          : formatter.format(_selectedDate6!),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: currentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //For Time Picker

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
                      _selectedTime6 == null
                          ? "Select a time"
                          : "${_selectedTime6!.hourOfPeriod}:${_selectedTime6!.minute} ${_selectedTime6!.period == DayPeriod.am ? "AM" : "PM"}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: currentTimePicker,
                      icon: const Icon(Icons.access_time_outlined),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //note Field

              SizedBox(
                width: 300,
                child: TextField(
                  controller: otherNoteController,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  maxLength: 150,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Notes...',
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

//BACKEND___________________--------------___________-----------_________------>>>>>>>>>>>>>>>>>>>>>>>>>>>--->>/////
              ElevatedButton(
                  onPressed: () {
                    print(otherController.text);

                    // print(_selectedDate);
                    print(formatter.format(_selectedDate6!));

                    // print(_selectedTime6);
                    print(
                        '${_selectedTime6!.hourOfPeriod}:${_selectedTime6!.minute} ${_selectedTime6!.period == DayPeriod.am ? "AM" : "PM"}');

                    print(otherNoteController.text);
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
