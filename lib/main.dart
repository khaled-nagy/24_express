import 'package:flutter/material.dart';
import 'package:express/language_params/translation.dart';
import 'package:express/ui/home.dart';

void main(){

  SpecifiedLocalizationDelegate _localeOverrideDelegate =
  new SpecifiedLocalizationDelegate(const Locale("ar", "en"));
  TextDirection _textDirection = TextDirection.ltr;
  onLocaleChange(Locale l, TextDirection textDirection) {
    _localeOverrideDelegate = new SpecifiedLocalizationDelegate(l);
    _textDirection = textDirection;

  }
  runApp(new MaterialApp(

    // home: new ScopeModelWrapper(),
    routes: {
      '/': (context)=> new Home(),

    },
    localizationsDelegates: [
      _localeOverrideDelegate,
      const TranslationsDelegate(),

    ],
    supportedLocales: [
      const Locale('ar', 'en'), // Arabic
      const Locale('en', 'ar'), // English
    ],
    builder: (BuildContext context, Widget child) {
      return Directionality(
        textDirection: _textDirection,
        child: child,
      );
    },
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      fontFamily: "hasen",
      primaryColor: Colors.blue[400],
      primarySwatch: Colors.blue,
    ),
  ));
}