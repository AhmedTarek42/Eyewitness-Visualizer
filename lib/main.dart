import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/welcome_screen/welcome_screen.dart';
import 'package:graduation_project/shared/bloc_observer.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';
import 'package:graduation_project/shared/network/remote/dio_helper.dart';
import 'firebase_options.dart';
import 'modules/eyewitness_visualizer_app/app_layout/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  //Widget widget;
  uId= await CacheHelper.getData(key: 'uId');
  //(uId==null)?widget=LoginScreen():widget=WelcomeScreen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1C1C23),),
      home: const HomeScreen(),

    );
  }
}


