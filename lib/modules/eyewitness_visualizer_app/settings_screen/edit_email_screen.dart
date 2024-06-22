import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/components/custom_text_button.dart';
import '../../../shared/components/custom_textform_field.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class EditEmailScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EyewitnessVisualizerCubit, EyewitnessVisualizerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = EyewitnessVisualizerCubit.get(context).userModel;
        emailController.text = userModel!.email!;
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 4.0,
            backgroundColor:Color(0xFF1C1C23),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,color: Colors.white,),
              onPressed: (){Navigator.pop(context);},),
            title: Text(
                'Change your E-mail address',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              CustomTextButton(onPressed: (){EyewitnessVisualizerCubit.get(context).updateUser(name:userModel?.name,phone: userModel?.phone,email: emailController.text );}, text: 'UPDATE', textColor: Colors.orange),
              SizedBox(width: 10.0,),
            ],

          ),
          body: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    label: 'E-mail Address',
                    type: TextInputType.emailAddress,
                    prefix: Icons.email_outlined,
                    controller: emailController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your E-mail';
                      }
                      return null;
                    },
                    onSubmit: (value) {
                    },
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}