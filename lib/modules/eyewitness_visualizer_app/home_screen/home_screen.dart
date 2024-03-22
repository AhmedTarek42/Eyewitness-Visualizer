import 'package:flutter/material.dart';
import 'chart.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen dynamically
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight + screenHeight * 0.25,
          child: Column(
            children: [
              // Chart Container
              Center(child:slider(context)),
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
        ),
      ),
    );
  }
}
