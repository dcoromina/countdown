import 'package:countdown/pages/card_detail.dart';
import 'package:flutter/material.dart';

class CountdownCard extends StatelessWidget {
  final String potato; // Specify your target date here

  CountdownCard({super.key, required this.potato});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double halfParentHeight = constraints.maxHeight / 2;

        return Dismissible(
          behavior: HitTestBehavior.translucent,
          confirmDismiss: (direction) async {
            if (direction != DismissDirection.startToEnd) {
              /* -------------- Delete card on swipe -----------*/
              return Future(() => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text(
                          'Are you sure you want to delete this countdown? Theres no going back after this.',
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Delete'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ));
            } else {
              /* ----------- Edit card on swipe -------*/
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CardDetail()));
            }
          },
          secondaryBackground: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red),
            child: const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(Icons.delete_forever, size: 75),
                )),
          ),
          background: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.blue),
            child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(Icons.edit, size: 75),
                )),
          ),
          key: const Key("dissmisible"),
          child: Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width / 1.05,
            decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 10.0,
                    color: Color.fromARGB(157, 0, 0, 0),
                  ),
                ],
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://dcoromina.s-ul.eu/icons/Brvmqy4f"),
                    fit: BoxFit.fitWidth,
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.darken),
                    opacity: 100),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: Colors.black26),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "09",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60),
                              ),
                              Text(
                                "Months",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "09",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60),
                              ),
                              Text(
                                "Days",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "09",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60),
                              ),
                              Text(
                                "Hours",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                        color: Color.fromARGB(157, 0, 0, 0),
                                      ),
                                    ],
                                    height: 0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(157, 0, 0, 0),
                            ),
                          ],
                          Icons.flight_takeoff_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Wrap(
                              children: [
                                Text(
                                  "Travel to brazil",
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 10.0,
                                          color: Color.fromARGB(157, 0, 0, 0),
                                        ),
                                      ],
                                      height: 0,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              "25/5/2024",
                              style: TextStyle(
                                  height: 0,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(157, 0, 0, 0),
                                    ),
                                  ],
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
