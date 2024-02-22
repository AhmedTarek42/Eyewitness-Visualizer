import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/components/buttons.dart';
import 'package:graduation_project/shared/components/custom_textform_field.dart';
import '../../../shared/components/navigators.dart';
import '../../../shared/components/strengt_indicator.dart';
import '../login_screen/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SecondRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  final focus = FocusNode();
  final focus_2 = FocusNode();
  final focus_3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit2(),
      child: BlocConsumer<RegisterCubit2, RegisterStates2>(
        listener: (context, state) {
          if (state is CreateUserSuccessState2) {
            navigateAndFinish(context, const LoginScreen());
          }
        },
        builder: (context, state) {
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
                        const Text(
                          'Register',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFFE0E0E6),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 8.0,
                          ),
                        ),
                        const SizedBox(
                          height: 58.0,
                        ),
                        CustomTextFormField(
                          label: 'Full Name',
                          type: TextInputType.name,
                          prefix: Icons.person,
                          controller: fullNameController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your Name';
                            }
                            return null;
                          },
                          onSubmit: (value) {
                            FocusScope.of(context).requestFocus(focus);
                          },
                        ), // name field
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextFormField(
                          focusNode: focus,
                          label: 'E-mail Address',
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                          controller: emailController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You must enter your password';
                            }
                            return null;
                          },
                          onSubmit: (value) {
                            FocusScope.of(context).requestFocus(focus_2);
                          },
                        ), // email field
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextFormField(
                          focusNode: focus_2,
                          label: 'Phone Number',
                          type: TextInputType.phone,
                          prefix: Icons.phone_android,
                          controller: phoneController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your Phone Number';
                            }
                            return null;
                          },
                          onSubmit: (value) {
                            FocusScope.of(context).requestFocus(focus_3);
                          },
                        ), // phone number field
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextFormField(
                          focusNode: focus_3,
                          label: 'Password',
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock_outline,
                          controller: passwordController,
                          suffix: RegisterCubit2.get(context).suffix,
                          isPassword: RegisterCubit2.get(context).isPassword,
                          onchange: (String password) {
                            RegisterCubit2.get(context).changeColor();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate() ?? false) {
                              RegisterCubit2.get(context).userRegister(
                                  name: fullNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text);
                            }
                          },
                          suffixOnPressed: () {
                            RegisterCubit2.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You must enter your password';
                            }
                            return null;
                          },
                        ), // password field
                        buildStrengthIndicator(passwordController.text),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60.0),
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState2,
                          builder: (context) => PrimaryButton(
                            buttonTitle: 'Get started, it’s free!',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit2.get(context).userRegister(
                                    name: fullNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text);
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Do you have already an account?',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SecondaryButton(
                          buttonTitle: 'Sign In',
                          onPressed: () {
                            navigateTo(context, const LoginScreen());
                          },
                        )
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
