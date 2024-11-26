import 'package:flutter/material.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth.dart';
import 'package:isalmi/tabs/settings_tab/settings_provider.dart';
import 'package:isalmi/widget/loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});
  static const String routeName = '/hadeth';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
   
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
     Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth ;
     
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${settingsProvider.backgroundImageName}.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.1,
              horizontal: MediaQuery.sizeOf(context).width * 0.086),
          decoration: BoxDecoration(
              color:settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white, borderRadius: BorderRadius.circular(25)),
              
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text(hadeth.title,
                style:Theme.of(context).textTheme.headlineSmall?.copyWith(color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,),
                //selectionColor:AppTheme.black
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
               child: (hadeth.content.isEmpty == true)?const LoadingIndicator()
                 :ListView.builder(
                  padding: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.02),
                  itemBuilder: (context, index) => Text(
                    hadeth.content[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  itemCount: hadeth.content.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
