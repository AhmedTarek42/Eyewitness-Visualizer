import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/styles/icon_broken.dart';

import '../../modules/eyewitness_visualizer_app/cubit/cubit.dart';
import '../../modules/eyewitness_visualizer_app/cubit/states.dart';
import '../../modules/eyewitness_visualizer_app/search_screen/search_screen.dart';
import '../../shared/components/icon_bottom_bar.dart';
import '../../shared/components/navigators.dart';


class EyewitnessVisualizerLayout extends StatelessWidget {
  const EyewitnessVisualizerLayout({super.key});

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
                  decoration: const BoxDecoration(
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
                    backgroundColor: const Color(0xffff7966),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      IconBroken.Search,
                      color: Colors.white,
                    ),

                  )),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BottomAppBar(
                  height: 80,
                  color: const Color(0xFF353542),
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                  notchMargin: 7,
                  shape: const CircularNotchedRectangle(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconBottomBar(
                        icon: IconBroken.Home,
                        selected: cubit.currentIndex==0,
                        onPressed: () {
                        cubit.changeBottom(0);
                        cubit.bottomScreens;
                      },),
                      IconBottomBar(
                        icon: IconBroken.Chart,
                        selected: cubit.currentIndex==1,
                        onPressed: () {
                          cubit.changeBottom(1);
                          cubit.bottomScreens;
                        },),

                  const SizedBox(width: 20,),
                      IconBottomBar(
                        icon: IconBroken.Calendar,
                        selected: cubit.currentIndex==2,
                        onPressed: () {
                          cubit.changeBottom(2);
                          cubit.bottomScreens;
                        },),
                      IconBottomBar(
                        icon: IconBroken.Setting,
                        selected: cubit.currentIndex==3,
                        onPressed: () {
                          cubit.changeBottom(3);
                          cubit.bottomScreens;
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