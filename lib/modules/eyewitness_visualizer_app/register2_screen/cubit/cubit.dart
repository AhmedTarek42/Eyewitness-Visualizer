import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/register2_screen/cubit/states.dart';

import '../../../../models/user_model/user_model.dart';
import '../../../../shared/components/strengt_indicator.dart';




class RegisterCubit2 extends Cubit<RegisterStates2> {
  RegisterCubit2() : super(RegisterInitialState2());

  static RegisterCubit2 get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState2());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(name: name, email: email, phone: phone, uId: value.user!.uid);
    }).catchError((error) {
      emit(RegisterErrorState2(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState2());
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState2(error.toString()));
    });
  }

  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? Icons.visibility_off_outlined
        : Icons.remove_red_eye_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
void changeColor(){
    buildStrengthIndicator('');
    emit(ColorChangeState());
}
}






