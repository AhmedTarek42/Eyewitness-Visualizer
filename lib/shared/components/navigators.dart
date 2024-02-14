import 'package:flutter/material.dart';

Future navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        body: widget,
      ),
    ));

Future navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);
