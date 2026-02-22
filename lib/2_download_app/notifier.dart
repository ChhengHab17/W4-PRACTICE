import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/ui/providers/theme_color_provider.dart';
import 'package:w4_practice/2_download_app/ui/screens/downloads/widgets/download_controler.dart';

class Notifier extends ChangeNotifier {
  ThemeColor theme = currentThemeColor;
  int currentIndex = 0;

  final List<Ressource> ressources = [
    Ressource(name: "image1.png", size: 120),
    Ressource(name: "image1.png", size: 500),
    Ressource(name: "image3.png", size: 12000),
  ];

  late final List<DownloadController> controllers;

  Notifier() {
    controllers = ressources
        .map((ressource) => DownloadController(ressource))
        .toList();
  }

  void onThemeChange(ThemeColor newTheme) {
    theme = newTheme;
    notifyListeners();
  }

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
