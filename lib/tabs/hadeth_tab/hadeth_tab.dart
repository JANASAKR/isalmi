

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../settings_tab/settings_provider.dart';


class HadethTab extends StatefulWidget {
   const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
   List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    if (ahadeth.isEmpty){
    loadHadethFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/hadith_header.png',
        height: MediaQuery.sizeOf(context).height*0.25,),
        Divider(
          height: 25,
          thickness: 2.5,
          color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(AppLocalizations.of(context)!.ahadeth,style: Theme.of(context).textTheme.headlineSmall),
          
        ],

        ),
          Divider(
          height: 25,
          thickness: 2.5,
          color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,

        ),
        Expanded(child: ListView.builder(padding: const EdgeInsets.only(top: 15),
          itemBuilder: (context, index)=>
          GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(HadethScreen.routeName,
          arguments: ahadeth[index]),
          
          child: 
          Text(ahadeth[index].title,
          textAlign: TextAlign.center,
          style:Theme.of(context).textTheme.headlineSmall,),
        ),
        itemCount: ahadeth.length,))
      ],
    );
  }

  Future<void> loadHadethFile()async{
    String ahadethFileContent =await rootBundle.loadString('assets/ahadeth.txt');
     List <String> ahadethString = ahadethFileContent.split('#');
     ahadeth = ahadethString.map((hadethString){
      List <String>  hadethLines = hadethString.trim().split('\n');
      String title =hadethLines[0];
      hadethLines.removeAt(0);
      List<String>content =hadethLines ;
      return Hadeth(title,content);
     }).toList();
     setState(() {});
  }
}
