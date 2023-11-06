import 'package:flutter/material.dart';

class timepickerpage extends StatefulWidget {
  const timepickerpage({super.key});

  @override
  State<timepickerpage> createState() => _timepickerState();
}

class _timepickerState extends State<timepickerpage> {
  TimeOfDay? picked_time, selectedTime = TimeOfDay.now();

Future<Null> getTime(BuildContext context) async {
      picked_time = await showTimePicker(
        context: context,
        initialTime: selectedTime!,
      );
      if (picked_time != null && picked_time != selectedTime) {
        setState(() {
          selectedTime = picked_time;

        });
      }
    }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(onPressed: (){getTime(context);},
          child: Text("Test TimePicker"),
          ),
          Text("${selectedTime.toString().substring(0, 15)}"),
        ],
      ),
    );
  }
}