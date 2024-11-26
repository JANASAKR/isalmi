import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/tabs/quran_tab/quran_tab.dart';
import 'package:isalmi/tabs/settings_tab/settings_provider.dart';
import 'package:isalmi/widget/loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SuraScreen extends StatefulWidget {
  SuraScreen({super.key});
  static const String routeName = '/sura';

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> ayat = [];

  late SuraScreenArgs args;

  @override
   
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
     args = ModalRoute.of(context)!.settings.arguments as SuraScreenArgs;
     if(ayat.isEmpty == true){
     loadSuraFile();
     }
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${settingsProvider.backgroundImageName}.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.islami),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.1,
              horizontal: MediaQuery.sizeOf(context).width * 0.086),
          decoration: BoxDecoration(
              color: settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white, borderRadius: BorderRadius.circular(25)),
              
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text('سورة ${args.suraName}',
                style:Theme.of(context).textTheme.headlineLarge?.copyWith(color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,)
                ),
                Icon(Icons.play_circle,size: 30,
               color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,),

              ],),
              Divider(
                height: 7,
                thickness: 2.5,
                color:settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary ,
              ),
              Expanded(
               child: (ayat.isEmpty == true)?const LoadingIndicator()
                 :ListView.builder(
                  padding: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.02),
                  itemBuilder: (context, index) => Text(
                    ayat[index]+'(${index+1})',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  itemCount: ayat.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Future<void> loadSuraFile()async{
 await Future.delayed(const Duration(seconds: 1));
 String sura = await rootBundle.loadString('assets/suwr/${args.index + 1}.txt');
 //print(sura);
 ayat = sura.split('\r\n');
 setState((){});
}
}
