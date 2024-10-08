import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

bool _checkvalue = false;

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Transform.scale(
              scale: 2.5,
              child: Checkbox(
                fillColor: WidgetStateProperty.all<Color>(Colors.red),
                activeColor: Colors.red[100],
                checkColor: Colors.black,
                value: _checkvalue,
                onChanged: (bool? value) {
                  setState(() {
                    _checkvalue = value ?? false;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.amber)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.black)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.deepPurple)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.orange)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.green)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.blue)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
