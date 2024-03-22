import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/styles/colors.dart';
import 'days_picker.dart';
import 'months.dart';

class HistoryScreen extends StatefulWidget{
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime selectedDate = DateTime.now(); // Default selected date is the current date
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int selectedMonthIndex = DateTime.now().month - 1;
  String selectedMonth = DateFormat('MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF353542),
          elevation: 0,
          title: const Text(
            'History',
            style: TextStyle(
              color: greyText,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              decoration: const ShapeDecoration(
                color: Color(0xFF353542),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current\nMonth',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '3 images for today',
                            style: TextStyle(fontSize: 15, color: greyText),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: greyContainer,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                DropdownButton<String>(
                                  underline: Container(),
                                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor: myBlack,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  value: selectedMonth,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedMonth = newValue!;
                                      selectedMonthIndex =
                                          months.indexOf(selectedMonth);
                                    });
                                  },
                                  items: months.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      DaysPicker(
                        selectedDate: selectedDate,
                        selectedMonthIndex: selectedMonthIndex,
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MMMM').format(DateTime.now()),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        DateFormat(
                          'dd.MM.20yy',
                        ).format(DateTime.now()),
                        style: const TextStyle(fontSize: 12, color: greyText),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '2',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '     Successful\nIdentification(s)',
                        style: TextStyle(fontSize: 12, color: greyText),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}