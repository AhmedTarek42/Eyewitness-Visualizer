import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBottomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final void Function() onPressed;

  const IconBottomBar({super.key,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: onPressed,
            icon: Icon(icon,
              size: 30.0,
              color: selected?Colors.white:const Color(0xFF4E4E61),)),
      ],
    );
  }
}