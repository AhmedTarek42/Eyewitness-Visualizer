import 'package:flutter/material.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/home_screen/border_painter.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/home_screen/percent_indicator.dart';
import 'package:graduation_project/shared/components/navigators.dart';

import '../../../shared/components/buttons.dart';
import '../statistics_screen/statistics_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen dynamically
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          // Chart Container
          Opacity(
            opacity: 0.80,
            child: Container(
              width: screenWidth,
              // Maintain the aspect ratio
              height: screenWidth * 429 / 375,
              decoration: const ShapeDecoration(
                color: Color(0xFF353542),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:50.0),
                    child: Center(child: PercenIndicator()),
                  ),
                  SecondaryButton(
                    buttonTitle: 'See full statistics',

                    onPressed: ()
                    {
                      navigateTo(context, StatisticsScreen());
                    },

                  ),
                  SizedBox(height: screenHeight * 0.1 / 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: screenWidth / 3 - 10,
                        height: 75,
                        decoration: ShapeDecoration(color: const Color(0x334E4E61),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: CustomPaint(
                          painter: MiddleUpperBorderPainter(color: const Color(0xFFFF7966)),
                          child: const Padding(
                            padding: EdgeInsets.only(top:10.0),
                            child: Column(
                              children: [
                                Text('Total Images',
                                textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF83839C),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                                Text(
                                  '5,203',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: screenWidth / 3 - 10,
                        height: 75,
                        decoration: ShapeDecoration(color: const Color(0x334E4E61),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: CustomPaint(
                          painter: MiddleUpperBorderPainter(color: const Color(0xFFAD7BFF)),
                          child: const Padding(
                            padding: EdgeInsets.only(top:10.0),
                            child: Column(
                              children: [
                                Text('Failed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF83839C),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                          
                                  ),
                                ),
                                Text(
                                  '1,265',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: screenWidth / 3 - 10,
                        height: 75,
                        decoration: ShapeDecoration(color: const Color(0x334E4E61),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: CustomPaint(
                          painter: MiddleUpperBorderPainter(color: const Color(0xFF7DFFEE)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top:10.0),
                            child: Column(
                              children: [
                                Text('Success',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF83839C),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                                Text(
                                  '3,938',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Row of Containers
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    // Camera Container
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF4E4E61).withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Camera 1.png',
                                height: 57,
                                width: 64,
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              const Text(
                                'Camera',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0.08,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Upload Container
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF4E4E61).withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Upload.png',
                                height: 57,
                                width: 64,
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              const Text(
                                'Upload Image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0.08,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Additional Container with increased height
                Container(
                  margin: const EdgeInsets.all(16),
                  height: screenHeight * 0.15,
                  // Adjust the height as needed
                  width: screenWidth,
                  // Adjust the width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF4E4E61).withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/pen 1.png',
                          height: 57,
                          width: 64,
                        ),
                        SizedBox(
                          width: screenWidth * 0.7 / 2,
                        ),
                        const Text(
                          'Draw',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0.08,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
