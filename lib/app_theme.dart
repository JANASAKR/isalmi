import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = const Color(0xFFB7935F);
  static Color white = const Color(0xFFF8F8F8);
  static Color black = const Color(0xFF242424);

  static Color darkPrimary = const Color(0xFF141A2E);
  static Color gold = const Color(0xFFFACC1D);
  
  static ThemeData lightTheme = ThemeData(

    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:  AppBarTheme(
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 75,
      backgroundColor: Colors.transparent,
      titleTextStyle:TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color:black,)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      type: BottomNavigationBarType.fixed,
      // showUnselectedLabels:true,
      // showSelectedLabels: false,
      selectedItemColor: black,
      unselectedItemColor: white,
    )
  );
  
}