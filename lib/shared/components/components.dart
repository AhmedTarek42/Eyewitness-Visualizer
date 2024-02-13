import 'package:flutter/material.dart';




Widget defualtTextButton({
  required VoidCallback? function,
  required String text,
  required Color textColor,
}) => TextButton(
    onPressed: function,
    child: Text(text,style: TextStyle(color:textColor ),)
);

Widget defualtTextFeildForm(
    {
      required TextEditingController controller,
      required TextInputType type,
      required final FormFieldValidator<String> validate,
      required String label,
      required IconData prefixIcon,
      bool isPassword = false,
      IconData? suffix,
      VoidCallback? suffixPress,
      ValueChanged<String>? onSubmit,
      VoidCallback? onTap,
      Function? onChange,
    }) =>
    SizedBox(
      width: 327,
      height: 68,
      child: TextFormField(
        style: const TextStyle(color: Color(0xFFFF7F37)),

        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: (s) {
          onChange!(s);
        },
        validator: validate,
        onTap: onTap,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 1, color: Color(0xFF353542),
              )),
          focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(width: 1, color: Color(0xFFFF7F37),
                )),
          labelStyle: TextStyle(color: Color(0xFF666680)),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(top: 20.0),
          prefixIcon: Icon(
            prefixIcon,
          ),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.focused)
              ? Color(0xFFFF7F37)
              : Color(0xFF666680)),
          suffixIcon: IconButton(
            icon: Icon(
              suffix,
            ),
            onPressed: suffixPress,
          ),
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.focused)
              ? const Color(0xFFFF7F37)
              : const Color(0xFF666680)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 1, color: Color(0xFF353542),
            ),
          ),

        ),
      ),
    );


