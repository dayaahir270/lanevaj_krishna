

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lanevaj_krishna/controller/language_chage_controller.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';


enum Language {english, spanish}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWord),
        actions: [
      Consumer<LanguageChangeController>(
              builder: (context,provider,child){
                return PopupMenuButton(
                    onSelected: (Language item){
                      if(Language.english.name == item.name){
                        provider.changeLanguage(Locale('en'));
                      }else{
                        print('spans');
                        provider.changeLanguage(Locale('es'));
                      }
                    },
                    itemBuilder: (BuildContext context)=> <PopupMenuEntry<Language>>[
                      const PopupMenuItem(
                          value: Language.english,
                          child: Text('English')
                      ),
                      const PopupMenuItem(
                          value: Language.english,
                          child: Text('Spanish')
                      )
                    ]
                );
              }
              )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.helloWord),
          ],
        ),
      ),
    );
  }
}
