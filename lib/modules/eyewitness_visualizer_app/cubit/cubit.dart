import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/cubit/states.dart';
import '../History/history_screen.dart';
import '../Home/home_screen.dart';
import '../Settings/settings_screen.dart';
import '../Statistics/statistics_screen.dart';

class EyewitnessVisualizerCubit extends Cubit<EyewitnessVisualizerStates>{
  EyewitnessVisualizerCubit() : super(EyewitnessVisualizerInitialState());

  static EyewitnessVisualizerCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    HomeScreen(),
    StatisticsScreen(),
    HistoryScreen(),
    SettingsScreen(),

  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(EyewitnessVisualizerChangeBottomNavState());
  }
}