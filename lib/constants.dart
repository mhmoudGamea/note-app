import 'package:flutter/material.dart';

// Dark Theme
const Color mainDark = Color(0xff131718);
const Color secondaryDark = Color(0xff1c1e1f);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: mainDark, elevation: 0),
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: mainDark,
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500, fontFamily: 'Nunito'),
    subtitle2: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Nunito')
  )
);

// Hive package
const String kNotesBox = 'notes_box';