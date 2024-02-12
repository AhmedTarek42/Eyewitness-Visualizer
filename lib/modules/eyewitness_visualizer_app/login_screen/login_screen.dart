import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/welcome_screen/welcome_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../register1_screen/Register_Screen.dart';
import '../register2_screen/register2_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}
  class _LoginScreen extends State<LoginScreen> {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if(state is LoginSuccessState)
          {
            CacheHelper.saveData(
                key: 'uId',
                value:state.uId ).then((value) {
              navigateAndFinish(
                  context,
                  WelcomeScreen());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFFE0E0E6),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 8.0,
                        ),
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                      defualtTextFeildForm(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        label: 'Email Address',
                        prefixIcon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defualtTextFeildForm(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPassword,
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        suffixPress: () {
                          LoginCubit.get(context)
                              .changePasswordVisibility();
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        label: 'Password',
                        prefixIcon: Icons.lock_outline,
                      ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Color(0xFF353542),
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),// Set the border radius
                              ),

                            ),
                          ),
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                              activeColor: Color(0xFF666680),
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(color: Color(0xFF666680)),
                        ),
                        SizedBox(width: 70.0,),
                        defualtTextButton(function: () {  }, text: 'Forgot passoword?', textColor: Color(0xFF666680)),
                      ],
                    ),
                  ),
                      SizedBox(
                        height: 24.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defualtButton(
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          backgroundColor: 0xFFFF7F37,
                          text: 'Sign In',
                          isUpperCase: false,
                          textColor:Colors.white,
                          isImage: false,
                          boxShadowColor: 0x7FFF7966,
                          borderSideOpacity: 0.30000001192092896
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 150.0,
                      ),

                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You don\'t have an account yet?',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20.0,),
                            defualtButton(
                                isImage: false,
                                onPress: () {
                                  navigateTo(context, RegisterScreen2());
                                },
                                textColor: Colors.white,
                                text: 'Sign Up',
                                isUpperCase: false,
                                backgroundColor: 0x26FFFFFF
                            ),
                          ],
                        ),

                      ),
                    ],
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