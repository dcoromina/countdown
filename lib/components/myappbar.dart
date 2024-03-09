import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: null,
            child: Text("Active",
                style: TextStyle(color: Colors.white, fontSize: 17))),
        TextButton(
            onPressed: null,
            child: Text("Past",
                style: TextStyle(color: Colors.white, fontSize: 17))),
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
