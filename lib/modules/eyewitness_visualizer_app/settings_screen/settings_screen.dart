
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/cubit/states.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/login_screen/cubit/states.dart';

import '../../../shared/components/sign_google.dart';
import '../cubit/cubit.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({super.key});
    @override
    Widget build(BuildContext context) {
    return BlocConsumer<EyewitnessVisualizerCubit,EyewitnessVisualizerStates>(
      listener: (context,state){
        state is LoginSuccessState;
      },
      builder: (context,state){
        var userModel= EyewitnessVisualizerCubit.get(context).userModel;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF1C1C23),
            elevation: 0,
            leading: IconButton(
                onPressed: () {signOut();},
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xFFA2A2B5),
                )),
            title: const Text(
              'Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA2A2B5),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0.09,
                letterSpacing: 0.20,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height:  20,
                  ),
                  Container(
                    width: 72,
                    height: 72,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration:  BoxDecoration(
                            image:  DecorationImage(
                              image: NetworkImage(
                                  '${userModel?.image}'
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:8,
                  ),
                  Text('${userModel?.name}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const SizedBox(
                    height:6,
                  ),
                  Text(
                    '${userModel?.email}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A2B5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 0.20,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const SizedBox(
                    height:20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 33, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'General',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 328,
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0x334E4E61),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/FaceID.png'),
                            SizedBox(width: 20,),
                            Text(
                              'Profile picture',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            SizedBox(width: 80,),
                            Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            IconButton(onPressed: () {
                            }, icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),)
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset('assets/images/iCloud.png'),
                            const SizedBox(width: 20,),
                            const Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(width: 138,),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 33, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 328,
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0x334E4E61),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/Sorting.png'),
                            SizedBox(width: 20,),
                            Text(
                              'Full Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            SizedBox(width: 111,),
                            Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),)
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset('assets/images/PhoneCall.png'),
                            const SizedBox(width: 20,),
                            const Text(
                              'Phone',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(width: 135,),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 33, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Security',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 328,
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0x334E4E61),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/AppIcon.png'),
                            SizedBox(width: 20,),
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            SizedBox(width: 112,),
                            Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),)
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/LightTheme.png'),
                            const SizedBox(width: 20,),
                            const Text(
                              'Delete \nyour account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(width: 43,),
                            const Text(
                              'Permanently',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}