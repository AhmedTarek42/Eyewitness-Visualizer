import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/search_screen/search_screen.dart';
import 'package:graduation_project/shared/components/navigators.dart';

import '../../../shared/components/buttons.dart';
import '../home_screen/mapping.dart';

class SimilaritiesScreen extends StatelessWidget{
  final String outputImagePath;

  const SimilaritiesScreen({Key? key, required this.outputImagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> similarImages = digitalToSimilarMap[outputImagePath] ?? [];
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 45,),
          const Text(
            'Similarities',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFA2A2B5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0.9,
              letterSpacing: 0.20,
            ),
          ),
          const SizedBox(height: 85,),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio:1,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:
              List.generate(
                  similarImages.length
                  ,(index)=>Container(
                decoration: BoxDecoration(
                  color: Color(0xFF334E4E61),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    similarImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
