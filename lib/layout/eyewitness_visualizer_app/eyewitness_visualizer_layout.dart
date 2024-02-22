import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/eyewitness_visualizer_app/Search/search_screen.dart';
import '../../modules/eyewitness_visualizer_app/cubit/cubit.dart';
import '../../modules/eyewitness_visualizer_app/cubit/states.dart';
import '../../shared/components/navigators.dart';


class EyewitnessVisualizerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = EyewitnessVisualizerCubit.get(context);
    return BlocConsumer<EyewitnessVisualizerCubit, EyewitnessVisualizerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Center(
            child: Scaffold(
              extendBody: true,
              body: cubit.bottomScreens[cubit.currentIndex],
              floatingActionButton: Container(
                  margin: const EdgeInsets.only(top: 22),
                  height:57,
                  width: 57,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x7FFF7966),
                        blurRadius: 25,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ]
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Color(0xffff7966),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () { navigateTo(context, SearchScreen()); },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),

                  )),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BottomAppBar(
                  height: 80,
                  color: Color(0xFF353542),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  notchMargin: 7,
                  shape: CircularNotchedRectangle(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                  IconButton(
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Color(0xFF4E4E61) ,
                    size: 30.0,
                  ),
                  onPressed: () {
                    cubit.changeBottom(0);
                  },),
                  IconButton(
                  icon: const Icon(
                    Icons.app_registration_rounded,
                    color: Color(0xFF4E4E61),
                    size: 30.0,
                  ),
                  onPressed: () {
                    cubit.changeBottom(1);
                  },),
                  SizedBox(width: 20,),
                  IconButton(
                  icon: const Icon(
                    Icons.history,
                    color: Color(0xFF4E4E61),
                    size: 30.0,
                  ),
                  onPressed: () {
                    cubit.changeBottom(2);
                  },),
                  IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Color(0xFF4E4E61),
                    size: 30.0,
                  ),
                  onPressed: () {
                    cubit.changeBottom(3);
                  },),
                    ]
                ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}