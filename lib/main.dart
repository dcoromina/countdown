import 'package:countdown/components/myappbar.dart';
import 'package:countdown/components/mybottomnavbar.dart';
import 'package:countdown/components/test_card.dart';
import 'package:countdown/components/testcountdown.dart';
import 'package:countdown/pages/card_detail.dart';
import 'package:countdown/pages/countdown_page.dart';
import 'package:countdown/pages/create_countdown.dart';
import 'package:countdown/pages/streak_page.dart';
import 'package:countdown/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> cardList = List<int>.generate(20, (int index) => index);
  bool _showStreaks = false;

  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const MyAppBar(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _showStreaks ? _buildTextField() : _buildButton(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*  Navigator.push(
              context, MaterialPageRoute(builder: (context) => CardDetail())); */
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.white38),
                    borderRadius: BorderRadius.circular(15)),
                elevation: 16,
                child: const CreateCountdown(),
              );
            },
          );
        },
        tooltip: 'Create countdown',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar:
          const MyBottomNavBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildTextField() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _showStreaks = false; // Switch to showing the TextField.
        });
      },
      child: MyCountdowns(),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _showStreaks = true; // Switch to showing the TextField.
        });
      },
      child: MyStreaks(),
    );
  }
}
