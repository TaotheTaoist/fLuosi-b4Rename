import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  bool _isEnglish = true; // Default language is English

  bool get isEnglish => _isEnglish;

  void toggleLanguage() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }
}
