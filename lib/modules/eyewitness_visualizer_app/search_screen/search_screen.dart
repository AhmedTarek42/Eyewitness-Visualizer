import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/similarities_screen/similarities_screen.dart';

import '../../../layout/eyewitness_visualizer_app/eyewitness_visualizer_layout.dart';
import '../../../shared/components/buttons.dart';
import '../../../shared/components/divider.dart';
import '../../../shared/components/navigators.dart';

class SearchScreen extends StatelessWidget{
  final Uint8List uploadedImageBytes;
  final Uint8List matchedImageBytes;
  final String uploadedSketchLabel;
  final String matchedSketchLabel;
  final String matchedSketchPath;
  final double similarity;

  const SearchScreen({
    required this.uploadedImageBytes,
    required this.matchedImageBytes,
    required this.uploadedSketchLabel,
    required this.matchedSketchLabel,
    required this.matchedSketchPath,
    required this.similarity,
  }); //trying to make the parameters not required to call the class elsewhere

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 328,
              height: 766,
              decoration: ShapeDecoration(
                color: const Color(0xFF282833),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 329,
                    height: 332,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF353542),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: ()=>navigateTo(context, EyewitnessVisualizerLayout()),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size:40,
                              color: Color(0xFFA2A2B5),)),
                        const SizedBox(width: 85,),
                        const Text(
                          'Report',
                          style: TextStyle(
                            color: Color(0xFFA2A2B5),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0.9,
                            letterSpacing: 0.20,
                          ),
                        ),
                        const SizedBox(width: 85,),
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.delete_outline,
                              size: 26,
                              color: Color(0xFFA2A2B5),)),
                      ],
                    ),
                  ),
                  Column(
                  children: [
                    const SizedBox(height: 72.0,),
                    Container(
                      width: 165,
                      height: 248,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(matchedSketchPath),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 328,
                      height: 27,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 314,
                            top: 0,
                            child: Container(
                              width: 27,
                              height: 27,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF131318),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          const Center(child: MySeparator(color: Color(0xFF131318))),
                          Positioned(
                            left: -14,
                            top: 0,
                            child: Container(
                              width: 27,
                              height: 27,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF131318),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Container(
                      width: 288,
                      height: 256,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.10000000149011612),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.white.withOpacity(0.15000000596046448),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        const Row(
                        children: [
                          Text(
                            'Id',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 2,
                            ),
                          ),
                          SizedBox(width: 178),
                          Text(
                            'xxxxxxx',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFFA2A2B5),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.6,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ],),
                          const SizedBox(height: 16.0,),
                        const Row(
                        children: [
                          Text(
                            'Full Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 2,
                            ),
                          ),
                          SizedBox(width: 99),
                          Text(
                            'Peter Smith',
                            style: TextStyle(
                              color: Color(0xFFA2A2B5),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.6,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ],),
                          const SizedBox(height: 16.0,),
                        const Row(
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 2,
                            ),
                          ),
                          SizedBox(width: 130),
                          Text(
                            '14 Jan 17:32',
                            style: TextStyle(
                              color: Color(0xFFA2A2B5),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.6,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ],),
                          const SizedBox(height: 16.0,),
                        const Row(
                        children: [
                          Text(
                            'Similarity Score',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 2,
                            ),
                          ),
                          SizedBox(width: 85),
                          Text(
                            '88.3%',
                            style: TextStyle(
                              color: Color(0xFFA2A2B5),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.6,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ],),
                          const SizedBox(height: 2.0,),
                          Row(
                            children: [
                              const Text(
                                'Similarities',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.6,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Text(
                                    'View',
                                    style: TextStyle(
                                      color: Color(0xFFA2A2B5),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      letterSpacing: 0.20,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: ()=>navigateTo(context, SimilaritiesScreen()),
                                      icon: const Icon(Icons.arrow_forward_ios_outlined,
                                        color: Colors.grey,
                                      size: 12,)),
                                ],
                              ),
                            ],),
                        ]
                      ),
                    ),
                    const SizedBox(height: 60.0,),
                    SecondaryButton(buttonTitle: 'Save', onPressed: () {  },width: 288,)
                  ],
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

}