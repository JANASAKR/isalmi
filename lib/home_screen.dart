import 'package:flutter/material.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:isalmi/tabs/quran_tab/quran_tab.dart';
import 'package:isalmi/tabs/radio_tab/radio_tab.dart';
import 'package:isalmi/tabs/sebha_tab/sebha_tab.dart';
import 'package:isalmi/tabs/settings_tab/settings_provider.dart';
import 'package:isalmi/tabs/settings_tab/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCurrentIndex = 0;
  List<Widget> tabs =[ QuranTab(),const HadethTab(),const SebhaTab(), const RadioTab(),const SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(image:DecorationImage(image:AssetImage('assets/images/${Provider.of<SettingsProvider>(context).backgroundImageName}.png'),fit:BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.islami,
        )),
        body:tabs [selectedCurrentIndex],
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: selectedCurrentIndex,
          onTap: (index) => {
            selectedCurrentIndex = index,
            setState((){}),      
          } ,
        items: [
         BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.quran,
          icon:const ImageIcon(
          AssetImage('assets/images/moshaf_gold.png')
          )),
          BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.hadeth,
          icon:const ImageIcon(
          AssetImage('assets/images/quran-quran-svgrepo-com.png')
          )),
          BottomNavigationBarItem(
          label:AppLocalizations.of(context)!.sebha,
          icon: const ImageIcon(
          AssetImage('assets/images/sebha_blue.png')
          )),
          BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.radio,
          icon: const ImageIcon(
          AssetImage('assets/images/radio.png')
          )),
          BottomNavigationBarItem(icon:const Icon(Icons.settings_outlined),
          label: AppLocalizations.of(context)!.settings)
        ])
        
      ),
    );
  }
}