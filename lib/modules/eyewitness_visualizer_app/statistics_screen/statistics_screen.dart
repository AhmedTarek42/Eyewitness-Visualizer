import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget{

  const StatisticsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final ValueNotifier<double> _valueNotifier = ValueNotifier(78);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 30 ,),
                  const Text('Statistics',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A2B5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: 0.20,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1 ,),
                   Stack(
                     alignment: AlignmentDirectional.center,
                    children: [
                      CircularSeekBar(
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.3,
                      barWidth: 8,
                      startAngle: 90,
                      sweepAngle: 180,
                      strokeCap: StrokeCap.round,
                      progress: 78,
                      progressGradientColors: const [ Color(0xFF00FAD9),Colors.indigo,Colors.purple,],
                      dashWidth: 50,
                      dashGap: 15,
                      animation: true,
                    ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(top: 55),
                        width: screenWidth * 0.5,
                        height: screenHeight * 0.2,
                        child: const Column(
                          children: [
                          Text('78%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 0.06,),),
                          SizedBox(height: 20,),
                          Text(
                            'Success Rate',
                            style: TextStyle(
                              color: Color(0xFFA2A2B5),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0.11,
                              letterSpacing: 0.20,
                            ),
                          )
                        ],),
                      )
              
                    ]
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 64,
                      right: 65,
                      bottom: 20,
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0xFF4E4E61)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: double.infinity,
                      child: const Text(
                        'Successful Identification 👍',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0 ,),
                  SizedBox(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.1,
                          decoration: ShapeDecoration(
                            color: const Color(0x334E4E61),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.01,),
                                  Positioned.fromRect(
                                    rect: const Rect.fromLTWH(16,20, 328,84),
                                    child: Container(
                                      width: screenWidth * 0.1,
                                      height: screenHeight * 0.04,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/upload2.png'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.01,),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Text(
                                      'via',
                                      style: TextStyle(
                                        color: Color(0xFFA2A2B5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        height: 0.11,
                                        letterSpacing: 0.20,
                                      ),
                                    ),
                                    SizedBox(height:15 ,),
                                    Text(
                                      'Uploading',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 0.10,
                                      ),
                                    ),
                                  ],),
                                  const SizedBox(width: 137,),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '1,516',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 0.10,
                                        ),
                                      ),
                                      SizedBox(height:20 ,),
                                      Text(
                                        'images',
                                        style: TextStyle(
                                          color: Color(0xFFA2A2B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                    ],
                                  ),
              
                                ],
                              ),
                              Positioned(
                                left: 16,
                                top: 70,
                                child: SizedBox(
                                  width: 294,
                                  height: 3,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 294,
                                          height: 3,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF4E4E61),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 135,
                                          height: 3,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF00F9D8),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.1,
                          decoration: ShapeDecoration(
                            color: const Color(0x334E4E61),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 16,),
                                  Positioned.fromRect(
                                    rect: const Rect.fromLTWH(16,20, 328,84),
                                    child: Container(
                                      width: screenWidth * 0.1,
                                      height: screenHeight * 0.04,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/camera.png'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'via',
                                        style: TextStyle(
                                          color: Color(0xFFA2A2B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                      SizedBox(height:12 ,),
                                      Text(
                                        'Camera',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 0.10,
                                        ),
                                      ),
                                    ],),
                                  const SizedBox(width: 150,),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '2,000',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 0.10,
                                        ),
                                      ),
                                      SizedBox(height:20 ,),
                                      Text(
                                        'images',
                                        style: TextStyle(
                                          color: Color(0xFFA2A2B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              Positioned(
                                left: 16,
                                top: 70,
                                child: SizedBox(
                                  width: 294,
                                  height: 3,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 294,
                                          height: 3,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF4E4E61),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 186,
                                          height: 3,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFFFA699),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 328,
                          height: 84,
                          decoration: ShapeDecoration(
                            color: const Color(0x334E4E61),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 16,),
                                  Positioned(
                                    left: 16,
                                    top: 20,
                                    child: Container(
                                      width: 32,
                                      height: 33,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/drawing.png'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'via',
                                        style: TextStyle(
                                          color: Color(0xFFA2A2B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                      SizedBox(height:12 ,),
                                      Text(
                                        'Drawing',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 0.10,
                                        ),
                                      ),
                                    ],),
                                  const SizedBox(width: 153,),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '422',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 0.10,
                                        ),
                                      ),
                                      SizedBox(height:20 ,),
                                      Text(
                                        'images',
                                        style: TextStyle(
                                          color: Color(0xFFA2A2B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                left: 16,
                                top: 70,
                                child: SizedBox(
                                  width: 294,
                                  height: 3,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 294,
                                          height: 3,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF4E4E61),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 60,
                                          height: 3,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFAD7BFF),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 84,
                          width: 326,
                          padding: const EdgeInsets.symmetric(horizontal: 78),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFF4E4E61)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Add custom category ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFA2A2B5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 0.10,
                                ),
                              ),
                              const SizedBox(width: 9,),
                              Image.asset('assets/images/Add.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

}