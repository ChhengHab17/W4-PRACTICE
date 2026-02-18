import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/notifier.dart';
import 'ui/screens/settings/settings_screen.dart';
import 'ui/screens/downloads/downloads_screen.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Notifier notifier = Notifier();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: notifier,
      builder: (ctx, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: Screens(notifier: notifier),
        );
      },
    );
  }
}

class Screens extends StatelessWidget {
  const Screens({super.key, required this.notifier});
  final Notifier notifier;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [DownloadsScreen(notifier: notifier,), SettingsScreen(notifier: notifier,)];
    return Scaffold(
      body: pages[notifier.currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: notifier.currentIndex,
        onTap: (index) {
          notifier.changeTab(index);
        },
        selectedItemColor: notifier.theme.color,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Downloads'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Settings'),
        ],
      ),
    );
  }
}
