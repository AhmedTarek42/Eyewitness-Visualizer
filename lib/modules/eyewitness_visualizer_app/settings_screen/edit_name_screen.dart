import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/custom_text_button.dart';
import '../../../shared/components/custom_textform_field.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class EditNameScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EyewitnessVisualizerCubit, EyewitnessVisualizerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = EyewitnessVisualizerCubit.get(context).userModel;
        nameController.text = userModel!.name!;
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 4.0,
            backgroundColor:Color(0xFF1C1C23),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,color: Colors.white,),
              onPressed: (){Navigator.pop(context);},),
            title: Text(
              'Edit your name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              CustomTextButton(onPressed: (){
                EyewitnessVisualizerCubit.get(context).updateUser(name:nameController.text,phone: userModel?.phone,email: userModel?.email );}, text: 'UPDATE', textColor: Colors.orange),
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
                    label: 'Full Name',
                    type: TextInputType.name,
                    prefix: Icons.person,
                    controller: nameController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your Name';
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