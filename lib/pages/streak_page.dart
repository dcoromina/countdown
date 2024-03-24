import 'package:countdown/components/test_card.dart';
import 'package:countdown/styles.dart';
import 'package:flutter/material.dart';

class MyStreaks extends StatelessWidget {
  const MyStreaks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Patata")],
        ),
      ),
    );
  }
}
