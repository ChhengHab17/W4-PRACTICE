import 'package:flutter/material.dart';
import 'package:w4_practice/1_color_app/counter_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final counterNotifier = CounterNotifier();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListenableBuilder(
        listenable: counterNotifier,
        builder: (context, _) {
          return Home(counter: counterNotifier);
        },
      ),
    );
  }
}

enum CardType {
  red(color: Colors.red),
  blue(color: Colors.blue),
  green(color: Colors.green),
  yellow(color: Colors.yellow);

  const CardType({required this.color});
  final Color color;
}

class Home extends StatelessWidget {
  const Home({super.key, required this.counter});
  final CounterNotifier counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: counter.currentIndex == 0
          ? ColorTapsScreen(counter: counter)
          : StatisticsScreen(counter: counter),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: counter.currentIndex,
        onTap: (index) {
          counter.changeTab(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  final CounterNotifier counter;

  const ColorTapsScreen({super.key, required this.counter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: CardType.values
            .map(
              (card) => ColorTap(
                type: card,
                tapCount: counter.tapCount[card]!,
                onTap: () => counter.onTap(card),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type.color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  final CounterNotifier counter;

  const StatisticsScreen({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: CardType.values
              .map(
                (card) => Text(
                  '${card.name} Taps: ${counter.tapCount[card]}',
                  style: TextStyle(fontSize: 24),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
