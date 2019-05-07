import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:express/language_params/myapp.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ScopeModelWrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: MyApp());
  }

}

class AppModel extends Model {
  TextDirection _textDirection = TextDirection.rtl;
  TextDirection get textDirection => _textDirection ?? TextDirection.rtl;

  Locale appLocale;
  AppModel({this.appLocale});

  String _locale = "ar";
  String get locale => _locale ?? "ar";

  void changeDirection() {
    if (_textDirection == TextDirection.rtl) {
      _textDirection = TextDirection.ltr;
      _locale = "en";
    } else {
      _textDirection = TextDirection.rtl;
      _locale = "ar";
    }
    notifyListeners();
  }

  void changeToArabic() async {
    final prefs = await SharedPreferences.getInstance();
    appLocale = Locale("ar");
    prefs.setString('locale', "ar");
    print("change to");
    print(appLocale);
    print((prefs.getString('locale')));
    notifyListeners();
  }

  void changeToEnglish() async {
    final prefs = await SharedPreferences.getInstance();
    appLocale = Locale("en");
    prefs.setString('locale', "en");
    print("change to");
    print(appLocale);
    print((prefs.getString('locale')));
    notifyListeners();
  }

}
