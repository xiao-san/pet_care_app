import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class SchedulePage2 extends StatefulWidget {
  const SchedulePage2({super.key});

  @override
  State<SchedulePage2> createState() => _SchedulePage2State();
}

class _SchedulePage2State extends State<SchedulePage2> {
  TextEditingController medicineTypeController = TextEditingController();
  TextEditingController medicineNoteTypeController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

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
      _selectedDate = pickedDate;
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
      _selectedTime = pickedTime;
    });
  }

  // void _selectDateTime() async {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(now.year, now.month, now.day);
  //   final lastDate = DateTime(now.year + 1, now.month, now.day);

  //   final picked = await showDatePicker(
  //     context: context,
  //     initialDate: now,
  //     firstDate: firstDate,
  //     lastDate: lastDate,
  //   );

  //   if (picked != null) {
  //     final time = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay.now(),
  //     );

  //     if (time != null) {
  //       setState(() {
  //         _selectedDateTime = DateTime(
  //             picked.year, picked.month, picked.day, time.hour, time.minute);
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication'),
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
                backgroundImage: AssetImage('assets/scheduleimg/2.png'),
                radius: 30,
              ),
              const SizedBox(
                height: 20,
              ),

              //Second Textfield For Vaccine Type
              SizedBox(
                width: 300,
                child: TextField(
                  controller: medicineTypeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter Medicine Type',
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
                      _selectedDate == null
                          ? "Select a Date"
                          : formatter.format(_selectedDate!),
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
                      _selectedTime == null
                          ? "Select a time"
                          : "${_selectedTime!.hourOfPeriod}:${_selectedTime!.minute} ${_selectedTime!.period == DayPeriod.am ? "AM" : "PM"}",
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
                  controller: medicineNoteTypeController,
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
                    print(medicineTypeController.text);

                    // print(_selectedDate);
                    print(formatter.format(_selectedDate!));

                    // print(_selectedTime);
                    print(
                        '${_selectedTime!.hourOfPeriod}:${_selectedTime!.minute} ${_selectedTime!.period == DayPeriod.am ? "AM" : "PM"}');

                    print(medicineNoteTypeController.text);
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
