
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData themEnglish=ThemeData(
   appBarTheme: const AppBarTheme(
    color: Appcolors.primarycolor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Appcolors.grey),
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)
   ),
   floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Appcolors.primarycolor
   ),
    fontFamily: "PlayfairDisplay",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Appcolors.black,
        height: 3),
      displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Appcolors.black),
      bodyLarge: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: Appcolors.grey,
        fontSize: 14,),
      bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: Appcolors.grey,
        fontSize: 14,),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
    );