import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/welcome_screen/welcome_screen.dart';
import '../../../shared/components/components.dart';
import '../login_screen/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen2 extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>RegisterCubit2(),
      child: BlocConsumer<RegisterCubit2,RegisterStates2>(
        listener:(context,state){
          if(state is CreateUserSuccessState2)
          {
            navigateAndFinish(context, LoginScreen());
          }
        },
        builder:(context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Register',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFFE0E0E6),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 8.0,
                          ),
                        ),
                        SizedBox(
                          height: 58.0,
                        ),

                        defualtTextFeildForm(
                          controller: fullNameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          label: 'Full Name',
                          prefixIcon: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),

                        defualtTextFeildForm(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'E-mail Address',
                          prefixIcon: Icons.email_outlined,
                        ),

                        SizedBox(
                          height: 15.0,
                        ),

                        defualtTextFeildForm(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          label: 'Phone Number',
                          prefixIcon: Icons.phone_android,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),

                        defualtTextFeildForm(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix:RegisterCubit2.get(context).suffix ,
                          isPassword:RegisterCubit2.get(context).isPassword ,
                          onChange: (String password){
                            RegisterCubit2.get(context).changeColor();
                            },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit2.get(context).userRegister(
                                  name: fullNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text
                              );
                            }
                          },
                          suffixPress: ()
                          {
                            RegisterCubit2.get(context).changePasswordVisibility();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefixIcon: Icons.lock_outline,
                        ),
                        buildStrengthIndicator(passwordController.text),

                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Text(
                            'Use 8 or more characters with a mix of letters,\nnumbers & symbols.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF666680),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.1,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState2,
                          builder: (context) => defualtButton(
                            isImage: false,
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit2.get(context).userRegister(
                                    name: fullNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text
                                );
                              }
                            },
                              textColor: Colors.white,
                              text: 'Get started, it’s free!',
                              isUpperCase: false,
                              backgroundColor: 0xFFFF7F37,
                              boxShadowColor: 0x7FFF7966,
                              borderSideOpacity: 0.30000001192092896
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20.0,),
                        Text(
                          'Do you have already an account?',
                          style: TextStyle(fontSize: 14.0,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20.0,),
                        defualtButton(
                            isImage: false,
                            onPress: () {
                              navigateTo(context, LoginScreen());
                            },
                            textColor: Colors.white,
                            text: 'Sign In',
                            isUpperCase: false,
                            backgroundColor: 0x26FFFFFF
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
