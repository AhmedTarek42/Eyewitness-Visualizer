import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/custom_text_button.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class EditPasswordScreen extends StatelessWidget {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EyewitnessVisualizerCubit, EyewitnessVisualizerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = EyewitnessVisualizerCubit.get(context).userModel;
        nameController.text = userModel!.email!;
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 4.0,
            backgroundColor:Color(0xFF1C1C23),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,color: Colors.white,),
              onPressed: (){Navigator.pop(context);},),
            title: Text(
              'Change your password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              CustomTextButton(onPressed: (){}, text: 'UPDATE', textColor: Colors.orange),
              SizedBox(width: 10.0,),
            ],
          ),
        );
      },
    );
  }
}