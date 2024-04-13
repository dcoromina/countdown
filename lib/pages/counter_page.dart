import 'package:countdown/components/counter_card.dart';
import 'package:flutter/material.dart';

class MyCounters extends StatefulWidget {
  const MyCounters({super.key});

  @override
  State<MyCounters> createState() => _MyCountersState();
}

class _MyCountersState extends State<MyCounters> {
  @override
  Widget build(BuildContext context) {
    return CounterCard();
  }
}
