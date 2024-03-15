import 'package:flutter/material.dart';

import 'months.dart';

class HistoryScreen extends StatefulWidget{
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text('History',
                        style: TextStyle(
                          color: Color(0xFFA2A2B5),
                          fontSize: 18

                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                        'Current\nMonth',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10,),
                    const Row(
                      children: [
                        Text(
                          '3 images for today',
                          style: TextStyle(
                              color: Color(0xFFA2A2B5),
                              fontSize: 18

                          ),

                        ),
                        Spacer(),
                        MonthsDropDownButton(),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    /*Expanded(
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Colors.black,
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                          // New date selected
                          setState(() {
                          });
                        },
                      ),
                    ),*/
                    Expanded(
                      child: Container(
                        width: 58,
                        height: 113,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xFF4E4E61)
                        ),
                        child: const Column(
                          children: [
                            Text('09',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                            ),
                            Text('Tu'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container())
        ],
      )
    );
  }
}