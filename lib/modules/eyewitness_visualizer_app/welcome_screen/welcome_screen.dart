import 'package:flutter/material.dart';
import '../../../shared/components/buttons.dart';
import '../../../shared/components/navigators.dart';
import '../login_screen/login_screen.dart';
import '../register1_screen/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Expanded(
            child: SizedBox(
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
      const Positioned(
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
          PrimaryButton(
            buttonTitle: 'Get started',
            onPressed: ()
            {
              navigateTo(context, const RegisterScreen());
            },
          ),
          const SizedBox(height: 10.0,),
          SecondaryButton(
              buttonTitle: 'I have an account',
              onPressed: () {
                navigateTo(context, const LoginScreen());
              },
            textColor: Colors.white,
              background: const Color(0x26FFFFFF),
          ),
          const SizedBox(height: 80.0,),
        ],
      ),
    );
  }

}