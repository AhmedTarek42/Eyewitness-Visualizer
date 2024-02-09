import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';
import '../login_screen/login_screen.dart';
import '../register1_screen/Register_Screen.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Stack(
    children: [
    Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
    child:  Image.asset('assets/images/Frame (1).png',
              width: 375.0,
              height: 366.0,
              fit: BoxFit.cover,
    ),
    ),
    Positioned(
              top: 148.0,
    left: 43.0,
    child:  Image.asset('assets/images/Frame.png',
              width: 289.0,
              height: 410.0,
              fit: BoxFit.cover,
    ),
    ),
    Positioned(
              top: 120.0,
    left: -229.0,
    child:  Image.asset('assets/images/1.png',
              width: 288.0,
              height: 219.0,

    ),
    ),
    Positioned(
              top: 396.0,
              left: 316.7,
                child: Transform.rotate(
                  angle: 41.66 * (3.14159265358979323846 / 180) ,
    child:  Image.asset('assets/images/BottomRight.png',
              width: 288.0,
              height: 219.0,
              fit: BoxFit.fill,
    ),
    ),
    ),
      Positioned(
        top:550.0 ,
        left: 30.0,
        width: 326.0,
        height: 40.0,
        child: Text(
          'Unveiling the truth through pixels: Transforming forensic sketches into a new realm of realism',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.5,
            letterSpacing: 0.20,
          ),
        ),
      ),
    ]
              ),
            ),
          ),
          defualtButton(
            isImage: false,
              onPress: () {
              navigateTo(context, RegisterScreen());
              },
              backgroundColor: 0xFFFF7F37,
              textColor: Colors.white,
              text: 'Get started',
              isUpperCase: false,
              boxShadowColor: 0x7FFF7966, borderSideOpacity: 0.30000001192092896),
          SizedBox(height: 10.0,),
          defualtButton(
            isImage: false,
              onPress: () {
                navigateTo(context, LoginScreen());
              },
              textColor: Colors.white,
              text: 'I have an account',
              isUpperCase: false,
              backgroundColor: 0x26FFFFFF
          ),
          SizedBox(height: 80.0,),
        ],
      ),
    );
  }

}