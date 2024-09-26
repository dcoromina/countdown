import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  bool showTravel = false;
  bool showSports = false;

  int count = 0;

  void ShowTravelSearch() {
    setState(() {
      showTravel == false ? showTravel = true : showTravel = false;
    });
  }

  void ShowSportModal() {
    setState(() {
      showSports == false ? showSports = true : showSports = false;
    });
  }

  void ButtonTest() {
    setState(() {
      showTravel;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showField = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
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
                    width: 65,
                    height: 65,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          elevation: MaterialStatePropertyAll(5)),
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Colors.white38),
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 16,
                              child: Container(
                                color: Colors.transparent,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child:
                                                Icon(Icons.sports_basketball)),
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child: Icon(Icons.sports_soccer)),
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child: Icon(Icons.sports_golf)),
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child: Icon(Icons.sports_baseball)),
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child: Icon(Icons.sports_cricket)),
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child: Icon(Icons.sports_football)),
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child: Icon(Icons.sports_hockey)),
                                        ElevatedButton(
                                            onPressed: ButtonTest,
                                            child:
                                                Icon(Icons.sports_volleyball)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      },
                      child: const Center(
                        child: Icon(
                          Icons.sports_basketball,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                    width: 65,
                    height: 65,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          elevation: MaterialStatePropertyAll(5)),
                      onPressed: () => {ShowTravelSearch()},
                      child: const Center(
                        child: Icon(
                          Icons.flight,
                          size: 40,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
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
        Visibility(
          visible: showTravel,
          child: Container(
            width: 150,
            height: 50,
            color: Colors.amber,
          ),
        ),
        Visibility(
          visible: showSports,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: ButtonTest,
                      child: Icon(Icons.sports_basketball)),
                  ElevatedButton(
                      onPressed: ButtonTest, child: Icon(Icons.sports_soccer)),
                  ElevatedButton(
                      onPressed: ButtonTest, child: Icon(Icons.sports_golf)),
                  ElevatedButton(
                      onPressed: ButtonTest,
                      child: Icon(Icons.sports_baseball)),
                  ElevatedButton(
                      onPressed: ButtonTest, child: Icon(Icons.sports_cricket)),
                  ElevatedButton(
                      onPressed: ButtonTest,
                      child: Icon(Icons.sports_football)),
                  ElevatedButton(
                      onPressed: ButtonTest, child: Icon(Icons.sports_hockey)),
                  ElevatedButton(
                      onPressed: ButtonTest,
                      child: Icon(Icons.sports_volleyball)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
