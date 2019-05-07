import 'dart:async';

import 'package:flutter/material.dart';
import 'package:express/i18/jops_texts.dart';


class TranslationsDelegate extends LocalizationsDelegate<Jops> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Jops> load(Locale locale) => Jops.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

class SpecifiedLocalizationDelegate
    extends LocalizationsDelegate<Jops> {
  final Locale overriddenLocale;

  const SpecifiedLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<Jops> load(Locale locale) =>
      Jops.load(overriddenLocale);

  @override
  bool shouldReload(SpecifiedLocalizationDelegate old) => true;
}
