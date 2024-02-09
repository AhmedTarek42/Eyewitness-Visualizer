import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme=ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 30.0,
    ),
    titleTextStyle: TextStyle(
      color:Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,

    )
    ,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 30.0,
    backgroundColor: HexColor('333739'),

  ),
  textTheme: TextTheme(
    bodyLarge:TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'janna',

);
ThemeData lightTheme=ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30.0,
    ),
    titleTextStyle: TextStyle(
      color:Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,

    )
    ,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 30.0,
    backgroundColor: Colors.white,

  ),
  textTheme: TextTheme(
    bodyLarge:TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
   fontFamily: 'janna',
);