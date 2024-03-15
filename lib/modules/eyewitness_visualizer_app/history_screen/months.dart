import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> months = <String>
['January', 'February', 'March' , 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];


class MonthsDropDownButton extends StatefulWidget {
  const MonthsDropDownButton({super.key});

  @override
  State<MonthsDropDownButton> createState() => _MonthsDropDownButtonState();
}

class _MonthsDropDownButtonState extends State<MonthsDropDownButton> {
  String dropdownValue = months.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(25),
      dropdownColor: const Color(0xFF353542),
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      iconEnabledColor: Colors.white,
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: months.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}