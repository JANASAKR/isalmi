import 'package:flutter/material.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/tabs/settings_tab/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int index = 0;

  List<String> zekr = [
    'سبحان اللَّهُ',
    'الحمد للَّهُ',
    'اللَّهُ أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.1),
                child: Image.asset(
                  settingsProvider.themeMode == ThemeMode.light
                      ? 'assets/images/head of seb7a.png'
                      : 'assets/images/head_seb7a_dark.png',
                  height: MediaQuery.sizeOf(context).height * 0.08,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.03),
                child: Image.asset(
                  settingsProvider.themeMode == ThemeMode.light
                      ? 'assets/images/body of seb7a.png'
                      : 'assets/images/body of seb7a dark.png',
                  height: MediaQuery.sizeOf(context).height * 0.30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            AppLocalizations.of(context)!.tasbeh,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                  color:
                      settingsProvider.isDark ? AppTheme.white : AppTheme.black,
                ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 25,
                      color: settingsProvider.isDark
                          ? AppTheme.gold
                          : AppTheme.white,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              onClick();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.lightPrimary,
              maximumSize: const Size(175, 50),
              minimumSize: const Size(175, 50),
            ),
            child: Text(
              zekr[index],
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,
                    color: settingsProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    // Add your logic here
    if (count < 33) {
      count++;
    } else {
      count = 0;
      index++;
      if (index == zekr.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}