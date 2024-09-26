import 'package:flutter/material.dart';
import 'dart:async';

import '../pages/card_detail.dart';

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
    var days = duration.inDays;
    int remainingMonths = 31 - DateTime.now().day;

    return '$remainingMonths';
  }

  String _formatTimeMonths(Duration duration) {
    var months = duration.inDays;
    double monthstrue = months.toDouble() / 30;
    months = monthstrue.toInt();

    return '$months';
  }

  String _formatTimeYears(Duration duration) {
    var years = duration.inDays / 30 / 12;
    var tyears = years.truncate();
    return '$tyears';
  }

  String _formatTimeHours(Duration duration) {
    final hours = duration.inHours % 24;
    final seconds = duration.inSeconds % 60;

    return '$hours';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        double halfParentHeight = constraints.maxHeight / 2;

        return Dismissible(
          behavior: HitTestBehavior.translucent,
          confirmDismiss: (direction) async {
            if (direction != DismissDirection.startToEnd) {
              /* -------------- Delete card on swipe -----------*/
              return Future(() => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text(
                          'Are you sure you want to delete this countdown? Theres no going back after this.',
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Delete'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ));
            } else {
              /* ----------- Edit card on swipe -------*/
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CardDetail()));
            }
          },
          secondaryBackground: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red),
            child: const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(Icons.delete_forever, size: 75),
                )),
          ),
          background: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.blue),
            child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(Icons.edit, size: 75),
                )),
          ),
          key: const Key("dissmisible"),
          child: Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width / 1.05,
            decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 10.0,
                    color: Color.fromARGB(157, 0, 0, 0),
                  ),
                ],
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://dcoromina.s-ul.eu/icons/Brvmqy4f"),
                    fit: BoxFit.fitWidth,
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.darken),
                    opacity: 100),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: Colors.black26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _formatTimeMonths(_remainingTime),
                                style: const TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60),
                              ),
                              const Text(
                                "Months",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _formatTimeDays(_remainingTime),
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60),
                              ),
                              Text(
                                "Days",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _formatTimeHours(_remainingTime),
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60),
                              ),
                              Text(
                                "Hours",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(157, 0, 0, 0),
                            ),
                          ],
                          Icons.flight_takeoff_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Wrap(
                              children: [
                                Text(
                                  "Travel to brazil",
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 10.0,
                                          color: Color.fromARGB(157, 0, 0, 0),
                                        ),
                                      ],
                                      height: 0,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              "25/5/2024",
                              style: TextStyle(
                                  height: 0,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(157, 0, 0, 0),
                                    ),
                                  ],
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );

    /* Scaffold(
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
    ); */
  }
}

void main() {
  runApp(MaterialApp(
    home: CountdownTimerScreen(
      targetDate: DateTime(2024, 12, 31), // Set your target date here
    ),
  ));
}
