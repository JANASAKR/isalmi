import 'package:flutter/material.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/home_screen.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth_screen.dart';
import 'package:isalmi/tabs/quran_tab/sura_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi/tabs/settings_tab/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(),
      child: const IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
   const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{HomeScreen.routeName:(context) => const HomeScreen(),
      SuraScreen.routeName:(context) =>  SuraScreen(),
      HadethScreen.routeName:(context) =>  const HadethScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme:AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),

    );
  }
}