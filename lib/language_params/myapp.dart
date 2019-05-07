import 'package:flutter/material.dart';

import 'package:express/language_params/scope_model_wrapper.dart';
import 'package:express/language_params/translation.dart';
import 'package:express/main.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:express/ui/home.dart';



//callback interface
typedef LocaleChangeCallback = void Function(
    Locale locale, TextDirection textDirection);

class MyApp extends StatefulWidget {
  int userOrCompany ;



  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {


  SpecifiedLocalizationDelegate _localeOverrideDelegate;
  TextDirection _textDirection = TextDirection.rtl;




  @override
  void initState() {
    print("here is ");

    super.initState();

    _localeOverrideDelegate =
    new SpecifiedLocalizationDelegate(const Locale("ar", "en"));



  }

  onLocaleChange(Locale l, TextDirection textDirection) {
    setState(() {
      _localeOverrideDelegate = new SpecifiedLocalizationDelegate(l);
      _textDirection = textDirection;
    });


  }





  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => new MaterialApp(
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
        )); //
  }
}
