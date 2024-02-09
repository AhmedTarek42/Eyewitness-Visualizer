import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';
import '../register2_screen/register2_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(
                  height: 458.0,),
                defualtButton(
                  onPress: () {  },
                  textColor: const Color(0xFF1C1C23),
                  text: 'Sign up with Google',
                  isUpperCase: false,
                  borderSideOpacity: 0.5,
                  backgroundColor:0xFFFFFFFF ,
                  boxShadowColor: 0x3FFFFFFF,
                  image: 'assets/images/Google.png',
                ),
                SizedBox(
                  height: 14.0,),
                defualtButton(
                  onPress: () {
                     signInWithFacebook();
                  },
                  textColor: const Color(0xFFFFFFFF),
                  text: 'Sign up with Facebook',
                  isUpperCase: false,
                  borderSideOpacity: 0.30000001192092896,
                  backgroundColor:0xFF1771E6 ,
                  boxShadowColor: 0x7F1771E6,
                  image: 'assets/images/Facebook.png',
                ),
                SizedBox(
                  height: 40.0,),
                Text('or',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                ),
                SizedBox(
                  height: 40.0,),
                defualtButton(
                    onPress: () { navigateTo(context, RegisterScreen2()); },
                    textColor: const Color(0xFFFFFFFF),
                    text: 'Sign up with E-mail',
                    isUpperCase: false,
                    borderSideOpacity: 0.15000000596046448,
                    backgroundColor:0x1AFFFFFF ,
                    boxShadowColor: 0,
                    isImage: false
                ),
                SizedBox(
                  height: 24.0,),
                SizedBox(
                  width: 326.0,
                  child: Text(
                    'By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF666680),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                      letterSpacing: 0.20,
                    ),
                  ),
                ),

              ],
            ),
          ),
    );



  }

}