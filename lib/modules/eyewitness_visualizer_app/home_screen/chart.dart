

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../shared/components/buttons.dart';
import '../../../shared/components/navigators.dart';
import '../../../shared/styles/colors.dart';
import '../statistics_screen/statistics_screen.dart';
import 'dash_report.dart';

Widget slider(BuildContext context) {
  return Container(

    decoration: const BoxDecoration(
      color: greyContainer,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.65,
    child: Stack(
      children: [
        Positioned(
          left:MediaQuery.of(context).size.width * 0.01 ,
          right:MediaQuery.of(context).size.width * 0.01 ,
          top:MediaQuery.of(context).size.height * 0.04 ,
          bottom:MediaQuery.of(context).size.height * 0.1 ,

          child: SizedBox(
            // alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width ,
            child: SvgPicture.asset(
              'assets/images/Ellipse2.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/c.png',
                fit: BoxFit.fitWidth,
              )),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * 0.1,
          left: MediaQuery.of(context).size.width * 0.3,
          right: MediaQuery.of(context).size.width * 0.3,
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              ),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.width * 0.06,
          right: MediaQuery.of(context).size.width * 0.06,
          child: Center(
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(
                startAngle: 142,
                angleRange: 260,
                customWidths: CustomSliderWidths(
                  progressBarWidth: 15,
                  trackWidth: 10,
                  handlerSize: 0,
                  shadowWidth: 0,
                ),
                size: MediaQuery.of(context).size.width ,
                animationEnabled: true,
                customColors: CustomSliderColors(
                    trackColors: [greyContainer, greyContainer],
                    progressBarColors: [myOrange, myOrange],
                    hideShadow: true),
                infoProperties: InfoProperties(
                  bottomLabelText: 'Images/month',
                  bottomLabelStyle: const TextStyle(color: greyText, fontSize: 14),
                  modifier: (percentage) => '1,235',
                  mainLabelStyle: const TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              initialValue: 80,
              onChange: (double value) {

              },
            ),
          ),
        ),
        const Positioned(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              DashReport(
                  categoryColor: myOrange,
                  categoryName: 'Total Images',
                  value: '5,203'),
              DashReport(
                  categoryColor: myPurple,
                  categoryName: 'Failed',
                  value: "1,265"),
              DashReport(
                  categoryColor: myGreen,
                  categoryName: 'Success',
                  value: '3,938'),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ) ,
        // see budget
        Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.25,
          right: MediaQuery.of(context).size.width * 0.25,
          child: SecondaryButton(
            buttonTitle: 'See full statistics',
            onPressed: ()
            {
              navigateTo(context, const StatisticsScreen());
            },
          ),
        ),
      ],
    ),
  );
}
