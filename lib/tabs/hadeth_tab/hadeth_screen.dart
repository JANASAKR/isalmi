import 'package:flutter/material.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/tabs/hadeth_tab/hadeth.dart';
import 'package:isalmi/widget/loading_indicator.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});
  static const String routeName = '/hadeth';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
   
  Widget build(BuildContext context) {
     Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth ;
     
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
                Text(hadeth.title,
                style:Theme.of(context).textTheme.headlineSmall,
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
