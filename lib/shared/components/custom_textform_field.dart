import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final String label;
  final IconData prefix;
  final String? Function(String?)? validate;
  final IconData? suffix;
  final bool isPassword;
  final bool isClickable;
  final FocusNode? focusNode;
  final void Function(String)? onSubmit;
  final void Function(String)? onchange;
  final void Function()? onTap;
  final Function()? suffixOnPressed;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.type,
    required this.prefix,
    required this.controller,
    this.suffix,
    this.suffixOnPressed,
    this.isPassword = false,
    this.isClickable = true,
    this.onSubmit,
    this.onchange,
    this.onTap,
    this.validate,
    void Function()? suffixPressed,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 68,
      child: TextFormField(
        style: const TextStyle(color: Color(0xFFFF7F37)),

        focusNode: focusNode,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onchange,
        validator: validate,
        obscureText: isPassword,
        onTap: isClickable ? onTap : null,
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFF353542),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFFFF7F37),
              )),
          labelStyle: const TextStyle(color: Color(0xFF666680)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.only(top: 20.0),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? const Color(0xFFFF7F37)
                  : const Color(0xFF666680)),
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? const Color(0xFFFF7F37)
                  : const Color(0xFF666680)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFF353542),
            ),
          ),
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixOnPressed,
                  icon: Icon(suffix!),
                )
              : null,
        ),
      ),
    );
  }
}
