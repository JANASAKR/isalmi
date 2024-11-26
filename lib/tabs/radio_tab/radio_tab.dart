

import 'package:flutter/material.dart';
import 'package:isalmi/app_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.17),
            child: Image.asset('assets/images/radio_header .png',),
          ),
       
        Padding(
          padding:  EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.046),
          child:  Text('إذاعة القرآن الكريم',style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppTheme.black) ,),
        ),
        Padding(
          padding:  EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.086),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(onPressed: (){}, icon: Icon(
              Icons.keyboard_double_arrow_left,
              size: 50,
              color:  AppTheme.lightPrimary,
            )),
            IconButton(onPressed: (){}, icon: Icon(
              Icons.play_arrow_rounded,
              size: 50,
              color:  AppTheme.lightPrimary,
            )),
            IconButton(onPressed: (){}, icon: Icon(
              Icons.keyboard_double_arrow_right,
              size: 50,
              color:  AppTheme.lightPrimary,
            ))
        
          ],
        
          ),
        ),
         
       
      ],
    );
  }
}

