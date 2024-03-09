import 'package:flutter/material.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Category",
            style: TextStyle(fontSize: 15),
          ),
        )),
        SizedBox(
          height: 70,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              /* height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,*/
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Icon(
                          Icons.sports_basketball_outlined,
                          size: 40,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Icon(
                          Icons.celebration_outlined,
                          size: 40,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Icon(
                          Icons.flight_takeoff_outlined,
                          size: 40,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Icon(
                          Icons.medical_services_outlined,
                          size: 40,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Icon(
                          Icons.work_outline_outlined,
                          size: 40,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Icon(
                          Icons.movie,
                          size: 40,
                        )),
                      ),
                    ),
                  ),
                  // ...
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
