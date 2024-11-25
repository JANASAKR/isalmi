import 'package:flutter/material.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:isalmi/tabs/quran_tab/quran_tab.dart';
import 'package:isalmi/tabs/radio_tab/radio_tab.dart';
import 'package:isalmi/tabs/sebha_tab/sebha_tab.dart';
import 'package:isalmi/tabs/settings_tab/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCurrentIndex = 0;
  List<Widget> tabs =[ QuranTab(),const HadethTab(),const SebhaTab(),const RadioTab(),const SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(image:DecorationImage(image:AssetImage('assets/images/background.png'),fit:BoxFit.fill)  
      ),
      child: Scaffold(
        appBar: AppBar(title:const Text('إسلامي',
        )),
        body:tabs [selectedCurrentIndex],
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: selectedCurrentIndex,
          onTap: (index) => {
            selectedCurrentIndex = index,
            setState((){}),      
          } ,
        items:const [
         BottomNavigationBarItem(
          label: 'القرآن',
          icon:ImageIcon(
          AssetImage('assets/images/moshaf_gold.png')
          )),
          BottomNavigationBarItem(
          label: 'الحديث',
          icon:ImageIcon(
          AssetImage('assets/images/quran-quran-svgrepo-com.png')
          )),
          BottomNavigationBarItem(
          label: 'السبحة',
          icon: ImageIcon(
          AssetImage('assets/images/sebha_blue.png')
          )),
          BottomNavigationBarItem(
          label: 'الراديو',
          icon: ImageIcon(
          AssetImage('assets/images/radio.png')
          )),
          BottomNavigationBarItem(icon:Icon(Icons.settings_outlined),
          label: 'الأعدادت')
        ])
        
      ),
    );
  }
}