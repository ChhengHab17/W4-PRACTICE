import 'package:flutter/material.dart';
import 'color_app.dart';

class CounterNotifier extends ChangeNotifier {
  int currentIndex = 0;
  final Map<CardType, int> tapCount = {
    for (CardType type in CardType.values) type: 0,
  };

  void onTap(CardType type) {
    tapCount[type] = tapCount[type]! + 1;
    notifyListeners();
  }

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
