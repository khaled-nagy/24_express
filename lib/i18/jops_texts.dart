import 'dart:async';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:express/i18/ar_en.dart';

class Jops {
  Jops(Locale locale) : _localeName = locale.toString();

  final String _localeName;


  static Future<Jops> load(Locale locale) {

    final String name = locale.countryCode != null
        ? locale.countryCode.isEmpty ? locale.languageCode : locale.toString()
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(locale.toString()).then((v) {
      return new Jops(locale);
    });
  }

  static Jops of(BuildContext context) {
    return Localizations.of<Jops>(context, Jops);
  }

  String login() => Intl.message(
    'Login',
    name: 'login',
    desc: '',
    locale: _localeName,
  );
  String enter_your_account() => Intl.message(
    'Enter your Account',
    name: 'enter_your_account',
    desc: '',
    locale: _localeName,
  );

  String password() => Intl.message(
    'Password',
    name: 'password',
    desc: '',
    locale: _localeName,
  );



  String how_are_we() => Intl.message(
    'how are we',
    name: 'how_are_we',
    desc: '',
    locale: _localeName,
  );

  String medical_guide() => Intl.message(
    'medical guide',
    name: 'medical_guide',
    desc: '',
    locale: _localeName,
  );

  String special_offers() => Intl.message(
    'special offers',
    name: 'special_offers',
    desc: '',
    locale: _localeName,
  );

  String request_card() => Intl.message(
    'request card',
    name: 'request_card',
    desc: '',
    locale: _localeName,
  );

  String call_us() => Intl.message(
    'call us',
    name: 'call_us',
    desc: '',
    locale: _localeName,
  );

  String notifications() => Intl.message(
    'notifications',
    name: 'notifications',
    desc: '',
    locale: _localeName,
  );

  String main() => Intl.message(
    'main',
    name: 'main',
    desc: '',
    locale: _localeName,
  );

  String favorite() => Intl.message(
    'favorite',
    name: 'favorite',
    desc: '',
    locale: _localeName,
  );

  String news() => Intl.message(
    'news',
    name: 'news',
    desc: '',
    locale: _localeName,
  );

  String events() => Intl.message(
    'events',
    name: 'events',
    desc: '',
    locale: _localeName,
  );

  String honors() => Intl.message(
    'honors',
    name: 'honors',
    desc: '',
    locale: _localeName,
  );

  String terms_and_conditions() => Intl.message(
    'terms and conditions',
    name: 'terms_and_conditions',
    desc: '',
    locale: _localeName,
  );

  String special_services() => Intl.message(
    'special services',
    name: 'special_services',
    desc: '',
    locale: _localeName,
  );

}
