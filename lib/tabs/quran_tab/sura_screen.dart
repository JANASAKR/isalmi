import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/tabs/quran_tab/quran_tab.dart';
import 'package:isalmi/widget/loading_indicator.dart';

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
     args = ModalRoute.of(context)!.settings.arguments as SuraScreenArgs;
     if(ayat.isEmpty == true){
     loadSuraFile();
     }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.1,
              horizontal: MediaQuery.sizeOf(context).width * 0.086),
          decoration: BoxDecoration(
              color: AppTheme.white, borderRadius: BorderRadius.circular(25)),
              
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text('سورة ${args.suraName}',
                style:Theme.of(context).textTheme.headlineLarge,
                //selectionColor:AppTheme.black
                ),
               const Icon(Icons.play_circle,size: 30,),

              ],),
              Divider(
                height: 7,
                thickness: 2.5,
                color:Theme.of(context).primaryColor ,
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
