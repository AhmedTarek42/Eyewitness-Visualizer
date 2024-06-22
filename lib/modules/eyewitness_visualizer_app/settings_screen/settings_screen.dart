import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/cubit/states.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/login_screen/cubit/states.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/settings_screen/edit_email_screen.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/settings_screen/edit_name_screen.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/settings_screen/edit_phone_screen.dart';
import 'package:graduation_project/shared/components/navigators.dart';

import '../../../shared/components/sign_google.dart';
import '../cubit/cubit.dart';
import 'edit_password_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EyewitnessVisualizerCubit, EyewitnessVisualizerStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          // handle login success state
        }
      },
      builder: (context, state) {
        var userModel = EyewitnessVisualizerCubit.get(context).userModel;
        var profileImage=EyewitnessVisualizerCubit.get(context).profileImage;
        var screenSize = MediaQuery.of(context).size;
        var isPortrait = screenSize.height > screenSize.width;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF1C1C23),
            elevation: 0,
            leading: IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFA2A2B5),
              ),
            ),
            title: const Text(
              'Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA2A2B5),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: isPortrait ? 16 : 32),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: profileImage==null ? NetworkImage('${userModel?.image}') : FileImage(profileImage) as ImageProvider,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${userModel?.name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${userModel?.email}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFA2A2B5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.20,
                    ),
                  ),
                  const SizedBox(height: 60),
                  buildSectionHeader('General'),
                  buildSettingsCard(screenSize, isPortrait, 'Profile picture', 'Edit', 'assets/images/FaceID.png', () {EyewitnessVisualizerCubit.get(context).getProfileImage().then((value) => EyewitnessVisualizerCubit.get(context).uploadProfileImage(name:userModel?.name,phone: userModel?.phone,email: userModel?.email ));}),
                  buildSettingsCard(screenSize, isPortrait, 'Email', 'Edit', 'assets/images/iCloud.png', ()=>navigateTo(context, EditEmailScreen())),
                  const SizedBox(height: 24),
                  buildSectionHeader('Profile'),
                  buildSettingsCard(screenSize, isPortrait, 'Full Name', 'Edit', 'assets/images/Sorting.png', () =>navigateTo(context, EditNameScreen())),
                  buildSettingsCard(screenSize, isPortrait, 'Phone', 'Edit', 'assets/images/PhoneCall.png', () =>navigateTo(context, EditPhoneScreen())),
                  const SizedBox(height: 20),
                  buildSectionHeader('Security'),
                  buildSettingsCard(screenSize, isPortrait, 'Password', 'Edit', 'assets/images/AppIcon.png', () =>navigateTo(context, EditPasswordScreen())),
                  buildSettingsCard(screenSize, isPortrait, 'Delete your account', 'Permanently', 'assets/images/LightTheme.png', () {}),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, bottom: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildSettingsCard(Size screenSize, bool isPortrait, String title, String action, String iconPath, VoidCallback onPressed) {
    return Container(
      width: screenSize.width * (isPortrait ? 0.85 : 0.7),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: ShapeDecoration(
        color: const Color(0x334E4E61),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Image.asset(iconPath),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  action,
                  style: const TextStyle(
                    color: Color(0xFFA2A2B5),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 3,),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFFA2A2B5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
