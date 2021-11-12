import 'package:flutter/material.dart';

final usualTheme = ThemeData(

    primaryColor: Colors.purple[600],
    primaryColorLight: Colors.purple[300],
    primaryColorDark: Colors.purple[800],

    accentColor: Colors.teal,

    appBarTheme: AppBarTheme(
      shadowColor: Colors.grey.withOpacity(0.8),
      elevation: 10,
    ),

    textTheme: const TextTheme(
        headline5: TextStyle(fontWeight: FontWeight.bold)
    ),

    fontFamily: "Oswald"
);