import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/cubit/states.dart';

import '../history_screen/history_screen.dart';
import '../home_screen/home_screen.dart';
import '../settings_screen/settings_screen.dart';
import '../statistics_screen/statistics_screen.dart';

class EyewitnessVisualizerCubit extends Cubit<EyewitnessVisualizerStates>{
  EyewitnessVisualizerCubit() : super(EyewitnessVisualizerInitialState());

  static EyewitnessVisualizerCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

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
}