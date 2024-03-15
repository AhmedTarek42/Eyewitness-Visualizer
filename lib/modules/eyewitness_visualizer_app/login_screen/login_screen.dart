import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/components/buttons.dart';
import 'package:graduation_project/shared/components/custom_textform_field.dart';
import '../../../layout/eyewitness_visualizer_app/eyewitness_visualizer_layout.dart';
import '../../../shared/components/custom_text_button.dart';
import '../../../shared/components/navigators.dart';
import '../../../shared/components/toast.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../second_register_screen/second_register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isChecked = false;
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.error);
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, const EyewitnessVisualizerLayout());
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
                      CustomTextFormField(
                        label: 'Email Address',
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
                          FocusScope.of(context).requestFocus(focus);
                        },
                      ), // email field
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        focusNode: focus,
                        type: TextInputType.visiblePassword,
                        prefix: Icons.lock_outline,
                        controller: passwordController,
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPassword,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'You must enter your password';
                          }
                          return null;
                        },
                        onSubmit: (value) {
                          if (formKey.currentState?.validate() ?? false) {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        suffixOnPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                      ), // password field
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: const Color(0xFF353542),
                                checkboxTheme: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        4.0), // Set the border radius
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
                                activeColor: const Color(0xFF666680),
                              ),
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(color: Color(0xFF666680)),
                            ),
                            const SizedBox(
                              width: 50.0,
                            ),
                            CustomTextButton(
                              onPressed: () {},
                              text: 'Forgot password?',
                              textColor: const Color(0xFF666680),
                            ), // forgot password?
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => PrimaryButton(
                          buttonTitle: 'Sign In',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(
                        height: 150.0,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'You don\'t have an account yet?',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            SecondaryButton(
                              buttonTitle: 'Sign Up',
                              onPressed: () {
                                navigateTo(context, SecondRegisterScreen());
                              },
                            )
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
