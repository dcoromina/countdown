import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime selectedDate = DateTime.now();
  DateTime myFirstDate = DateTime.timestamp();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2014, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Event's date"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(124, 255, 255, 255)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                  width: 20,
                ),
                ElevatedButton(
                  onLongPress: () => _selectDate(context),
                  style: const ButtonStyle(),
                  onPressed: () => _selectDate(context),
                  child: const Icon(Icons.calendar_month_outlined, size: 30),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
