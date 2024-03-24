import 'package:countdown/main.dart';
import 'package:countdown/pages/card_detail.dart';
import 'package:countdown/pages/streak_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const TextButton(
          onPressed: null,
          child: TextButton(
            onPressed: null,
            child: Text(
              "Countdowns",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
        ElevatedButton(
            child: Text(
              "Streaks",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyStreaks()),
              );
            })
      ]),
    );
  }
}
