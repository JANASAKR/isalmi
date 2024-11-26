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
      foregroundColor: black,
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
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: black,

      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: white,
      centerTitle: true,
      toolbarHeight: 75,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme:  TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: gold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: gold,
      unselectedItemColor: white,
      backgroundColor: darkPrimary,
    ),
  );
  
}