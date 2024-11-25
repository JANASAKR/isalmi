import 'package:flutter/material.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/home_screen.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth_screen.dart';
import 'package:isalmi/tabs/quran_tab/sura_screen.dart';

void main(){
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
   const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{HomeScreen.routeName:(context) => const HomeScreen(),
      SuraScreen.routeName:(context) =>  SuraScreen(),
      HadethScreen.routeName:(context) =>  const HadethScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme:AppTheme.lightTheme,

    );
  }
}