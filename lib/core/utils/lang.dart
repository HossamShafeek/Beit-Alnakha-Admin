import 'package:flutter/material.dart';

enum LanguageType { arabic }

const String arabic = 'ar';

const String assetsLocalization = 'assets/translations';

const Locale arabicLocal = Locale("ar", "EG");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.arabic:
        return arabic;
    }
  }
}
