import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/welcome_screen/welcome_screen.dart';
import 'package:graduation_project/shared/bloc_observer.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';
import 'package:graduation_project/shared/network/remote/dio_helper.dart';
import 'firebase_options.dart';
import 'modules/eyewitness_visualizer_app/login_screen/login_screen.dart';
import 'modules/eyewitness_visualizer_app/register1_screen/register_screen.dart';
import 'modules/eyewitness_visualizer_app/register2_screen/register2_screen.dart';

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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1C1C23),),
      home: WelcomeScreen(),

    );
  }
}


