import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/search_screen/search_screen.dart';
import 'package:graduation_project/shared/components/navigators.dart';

import '../../../shared/components/buttons.dart';

class SimilaritiesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 45,),
          Text(
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
          SizedBox(height: 85,),
          Container(
            child: GridView.count(
              childAspectRatio:1.222,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children:
              List.generate(
                6,(index)=>Column(
                children: [
                  Container(
                    width: 152,
                    height: 154,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: ShapeDecoration(
                      color: Color(0x334E4E61),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0x26CFCFFC)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEEEEEE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child:
                                Stack(
                                    children: [
                                  Image(
                                    image: AssetImage('assets/images/base.png'),
                                  ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                          )
              ),
            ),
          ),
          SizedBox(height: 105,),
          SecondaryButton(
            buttonTitle: 'Back',
            onPressed: () =>navigateTo(context, SearchScreen()),
            width: 288,
          ),
        ],
      ),
    );
  }

}
