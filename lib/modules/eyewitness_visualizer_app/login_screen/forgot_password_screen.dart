import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/login_screen/login_screen.dart';
import 'package:graduation_project/shared/components/navigators.dart';
import 'package:graduation_project/shared/components/toast.dart';
import '../../../shared/components/buttons.dart';
import '../../../shared/components/custom_textform_field.dart';

class ForgotPasswordScreen extends StatefulWidget{
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();}

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 45.0),
                  child: Text(
                    'It\'s okay!\nReset your password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                CustomTextFormField(
                  label: 'E-mail Address',
                  type: TextInputType.emailAddress,
                  prefix: Icons.email_outlined,
                  controller: emailController,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'You must enter your E-mail';
                    }
                    return null;
                  },
                  onSubmit: (value) {
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SecondaryButton(
                  buttonTitle: 'Continue',
                  onPressed: () =>resetPassword().then((value) {navigateTo(context, LoginScreen());}),
                )
              ],
            ),
          ),
        ),
      );
    }

  }

  Future resetPassword()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    showToast(text: 'Password Reset Email Sent', state: ToastStates.error);
  }

