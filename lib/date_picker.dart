import 'package:flutter/material.dart';

class datepickerpage extends StatefulWidget {
  const datepickerpage({super.key});

  @override
  State<datepickerpage> createState() => _datepickerState();
}

class _datepickerState extends State<datepickerpage> {
  DateTime? dateTimenow = DateTime.now(), dateTimeTomorrow, picked_date;
  var year, month, day;
  
  Widget build(BuildContext context) {
    Future<Null> getDate(BuildContext context) async {
      picked_date = await showDatePicker(
          context: context,
          initialDate: dateTimenow!,
          firstDate: DateTime(dateTimenow!.year - 1),
          lastDate: DateTime(dateTimenow!.year + 1));

      if (picked_date != null && picked_date != dateTimenow) {
        setState(() {
          dateTimenow = picked_date;
        });
      }
    }

    

    return Center(
      child: Column(
        children: <Widget>[
           Text("${dateTimenow.toString().substring(0, 10)}"),
          MaterialButton(onPressed: (){getDate(context);},
          child: Text("Test DatePicker"),
          ),
        ],
      ),
    );
  }
}
