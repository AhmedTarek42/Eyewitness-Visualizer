import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/cubit/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/user_model/user_model.dart';
import '../../../shared/components/constants.dart';
import '../history_screen/history_screen.dart';
import '../home_screen/home_screen.dart';
import '../settings_screen/settings_screen.dart';
import '../statistics_screen/statistics_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;




class EyewitnessVisualizerCubit extends Cubit<EyewitnessVisualizerStates>{
  EyewitnessVisualizerCubit() : super(EyewitnessVisualizerInitialState());

  static EyewitnessVisualizerCubit get(context) => BlocProvider.of(context);

    UserModel? userModel;

  Future <void> getUserData()async  {
    emit(EyewitnessVisualizerGetUserLoadingState());

    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {

          userModel = UserModel.fromJson(value.data()!);
      emit(EyewitnessVisualizerGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(EyewitnessVisualizerGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  Color buttonColor=Colors.white;

  List<Widget> bottomScreens = [
    const HomeScreen(),
    StatisticsScreen(),
    HistoryScreen(),
    SettingsScreen(),

  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(EyewitnessVisualizerChangeBottomNavState());
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(EyewitnessVisualizerProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(EyewitnessVisualizerProfileImagePickedErrorState());
    }
  }

  void updateUser({
        String? name,
        String? phone,
        String? email,
        String? image,

      })
  {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      image: image??userModel!.image,
      uId: userModel!.uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(EyewitnessVisualizerUserUpdateErrorState());
    });
  }




  void uploadProfileImage({
    String? name,
    String? phone,
    String? email,
}) {
    emit(EyewitnessVisualizerUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(EyewitnessVisualizerUploadProfileImageSuccessState());
        print(value);
        updateUser(
            name: name,
            phone: phone,
            email: email,
            image: value
        );
      }).catchError((error) {
        emit(EyewitnessVisualizerUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(EyewitnessVisualizerUploadProfileImageErrorState());
    });
  }



}