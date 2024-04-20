import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimerScreen extends StatefulWidget {
  final DateTime targetDate; // Specify your target date here

  CountdownTimerScreen({required this.targetDate});

  @override
  _CountdownTimerScreenState createState() => _CountdownTimerScreenState();
}

class _CountdownTimerScreenState extends State<CountdownTimerScreen> {
  late Timer _timer;
  late Duration _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.targetDate.difference(DateTime.now());
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_remainingTime.inSeconds <= 0) {
        timer.cancel();
        // Handle timer completion (e.g., show a message)
      } else {
        setState(() {
          _remainingTime -= oneSecond;
        });
      }
    });
  }

  String _formatTimeDays(Duration duration) {
    var days = duration.inDays.truncate();

    return '$days';
  }

  String _formatTimeMonths(Duration duration) {
    final months = duration.inDays / 30;

    return ' $months';
  }

  String _formatTimeYears(Duration duration) {
    final months = duration.inDays / 30;
    print(duration.inDays / 30);
    var years = months / 12.truncate();
    return '$years years';
  }

  String _formatTimeHours(Duration duration) {
    final hours = duration.inHours % 24;
    final seconds = duration.inSeconds % 60;

    return ' $hours hours $seconds seconds';
  }

/*     final years = months / 12;
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60; */

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              _formatTimeYears(_remainingTime),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              _formatTimeMonths(_remainingTime),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              _formatTimeHours(_remainingTime),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CountdownTimerScreen(
      targetDate: DateTime(2024, 12, 31), // Set your target date here
    ),
  ));
}
