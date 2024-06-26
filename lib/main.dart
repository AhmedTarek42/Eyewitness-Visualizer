import 'package:bloc/bloc.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/login_screen/login_screen.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/welcome_screen/welcome_screen.dart';
import 'package:graduation_project/shared/bloc_observer.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';
import 'package:graduation_project/shared/network/remote/dio_helper.dart';
import 'firebase_options.dart';
import 'layout/eyewitness_visualizer_app/eyewitness_visualizer_layout.dart';
import 'modules/eyewitness_visualizer_app/cubit/cubit.dart';
import 'modules/eyewitness_visualizer_app/cubit/states.dart';
import 'modules/eyewitness_visualizer_app/history_screen/history_screen.dart';
import 'modules/eyewitness_visualizer_app/login_screen/cubit/cubit.dart';
import 'modules/eyewitness_visualizer_app/login_screen/forgot_password_screen.dart';
import 'modules/eyewitness_visualizer_app/register_screen/register_screen.dart';
import 'modules/eyewitness_visualizer_app/search_screen/search_screen.dart';
import 'modules/eyewitness_visualizer_app/settings_screen/settings_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => EyewitnessVisualizerCubit()..getUserData()),
      ],
      child: BlocConsumer<EyewitnessVisualizerCubit,EyewitnessVisualizerStates>(
        listener: (context,  state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1C1C23),),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}


