

import 'package:flutter/material.dart';
import 'package:isalmi/app_theme.dart';
import 'package:isalmi/tabs/quran_tab/sura_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi/tabs/settings_tab/settings_provider.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});
  final List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Image.asset('assets/images/quran_header_icn.png',
        height: MediaQuery.sizeOf(context).height*0.25,),
        Padding(
          padding:  EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.016),
          child: Divider(
            height: 25,
            thickness: 2.5,
            color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
        
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(AppLocalizations.of(context)!.sura,style: Theme.of(context).textTheme.headlineSmall?.copyWith(color:settingsProvider.isDark ? AppTheme.white : AppTheme.black,),),
          
        ],

        ),
          Divider(
          height: 25,
          thickness: 2.5,
          color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,

        ),
        Expanded(child: ListView.builder(padding: const EdgeInsets.only(top: 15),
          itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(SuraScreen.routeName,
          arguments: SuraScreenArgs(index: index, suraName: suraName[index])
          ),
          child: Text(suraName[index],
          textAlign: TextAlign.center,
          style:Theme.of(context).textTheme.headlineSmall,),
        ),
        itemCount: suraName.length,))
      ],
    );
  }
}
class SuraScreenArgs{
  int index ;
  String suraName;
  SuraScreenArgs({required this.index,required this.suraName});

}
