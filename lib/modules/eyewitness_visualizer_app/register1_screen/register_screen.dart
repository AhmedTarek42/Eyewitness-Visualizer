import 'package:flutter/material.dart';
import 'package:graduation_project/shared/components/buttons.dart';
import '../../../shared/components/navigators.dart';
import '../../../shared/components/sign_facebook.dart';
import '../register2_screen/register2_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 458.0,),
                PrimaryButton(
                    buttonTitle: 'Sign up with Google',
                    onPressed: () {},
                    background:const Color(0xFFFFFFFF),
                  borderSideOp: 0.5,
                  boxShadowColor: 0x3FFFFFFF,
                  textColor: Colors.black,
                  isImage: true,
                  image: 'assets/images/Google.png',

                ) // sign up with google button
                ,const SizedBox(
                  height: 14.0,),
                PrimaryButton(
                    buttonTitle: 'Sign up with Facebook',
                    onPressed: () {
                      signInWithFacebook();
                    },
                  background: const Color(0xFF1771E6),
                  borderSideOp: 0.30000001192092896,
                  boxShadowColor: 0x7F1771E6,
                  isImage: true,
                  image: 'assets/images/Facebook.png',

                ) // sign up with Facebook button
                ,const SizedBox(
                  height: 40.0,),
                const Text('or',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 40.0,),
                SecondaryButton(
                    buttonTitle: 'Sign up with E-mail',
                  textColor: const Color(0xFFFFFFFF),
                    onPressed: (){
                      navigateTo(context, RegisterScreen2());
                      },

                ), // sing up with E-mail button
                const SizedBox(
                  height: 24.0,),
                const SizedBox(
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