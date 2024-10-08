import 'package:countdown/components/myappbar.dart';
import 'package:countdown/components/timer.dart';
import 'package:countdown/pages/counter_page.dart';
import 'package:countdown/pages/streak_page.dart';
import 'package:countdown/styles.dart';
import 'package:countdown/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    CountdownTimerScreen(targetDate: DateTime(2026, 06, 12)),
    const MyStreaks(),
    const MyCounters()
  ];
  List<int> cardList = List<int>.generate(20, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const MyAppBar(),
      body: SafeArea(
        child: Center(
          child: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 10.0,
                color: Color.fromARGB(157, 0, 0, 0),
              )
            ]),
        unselectedLabelStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
        selectedIconTheme: const IconThemeData(opacity: 1.0, size: 25),
        unselectedIconTheme: const IconThemeData(opacity: 1.0, size: 25),
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.punch_clock),
            label: 'Countdowns',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Streaks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            label: 'Counter',
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
