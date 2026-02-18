import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/ui/providers/theme_color_provider.dart';

class Notifier extends ChangeNotifier {
  ThemeColor theme = currentThemeColor;
  int currentIndex = 0;

  void onThemeChange(ThemeColor newTheme) {
    theme = newTheme;
    notifyListeners();
  }

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
