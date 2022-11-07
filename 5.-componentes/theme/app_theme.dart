import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.orange;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //color primario
      primaryColor: primary,
      //appbar theme
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.red),
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            //stadium border tambien me sirve para poder hacer redondeado el borde
            shape: StadiumBorder(),
            elevation: 0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          )),
      scaffoldBackgroundColor: Colors.blue[100]);
}
