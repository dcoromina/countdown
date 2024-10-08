import 'package:countdown/pages/create_counter.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatefulWidget {
  const CounterCard({super.key});

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*  Navigator.push(
              context, MaterialPageRoute(builder: (context) => CardDetail())); */
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.white38),
                    borderRadius: BorderRadius.circular(15)),
                elevation: 16,
                child: const CreateCounter(),
              );
            },
          );
        },
        tooltip: 'Create countdown',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Dismissible(
              key: const Key("counterKey"),
              behavior: HitTestBehavior.translucent,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(157, 0, 0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber),
                  width: MediaQuery.of(context).size.width / 1.05,
                  height: MediaQuery.of(context).size.height / 4.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Title",
                              style: TextStyle(fontSize: 30),
                            ),
                            AnimatedOpacity(
                              opacity: _counter != 0 ? 1.0 : 1.0,
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                '$_counter',
                                style: const TextStyle(
                                  fontSize: 48.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red)),
                              disabledColor: Colors.black,
                              onPressed: _incrementCounter,
                              icon: const Icon(Icons.add),
                            ),
                            AnimatedOpacity(
                                opacity: _counter != 0
                                    ? 1.0
                                    : 0.0, //If allow negative numbers allowed change num to 1

                                duration: const Duration(milliseconds: 500),
                                child: IconButton(
                                    onPressed: _decrementCounter,
                                    icon: const Icon(Icons.minimize))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
