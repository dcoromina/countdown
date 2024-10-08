import 'package:countdown/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Row(
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
        ),
        const SizedBox(width: 95),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MySettings()),
            );
          },
        )
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
