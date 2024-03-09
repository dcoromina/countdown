import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
          onPressed: null,
          child: Text(
            "Countdowns",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        TextButton(
            onPressed: null,
            child: Text(
              "Streaks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ))
      ]),
    );
  }
}
