import 'package:countdown/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
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
        SizedBox(width: 95),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CardDetail()));
          },
        )
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
