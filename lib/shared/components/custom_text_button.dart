import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color textColor;

  const CustomTextButton({super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text,
          style: TextStyle(color: textColor),
        )
    );
  }
}



