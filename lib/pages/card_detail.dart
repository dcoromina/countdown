import 'package:countdown/components/datepicker.dart';
import 'package:countdown/components/formCategory.dart';
import 'package:countdown/styles.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

final _formKey = GlobalKey<FormState>();

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          actions: const [
            IconButton(
              icon: Icon(Icons.check, color: Colors.black),
              onPressed: null,
            )
          ],
          title: const Text("Details",
              style: TextStyle(
                fontSize: 20,
              )),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(157, 0, 0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://dcoromina.s-ul.eu/icons/Brvmqy4f"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black12, BlendMode.darken),
                          opacity: 100)),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width / 1.05,
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: null,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "01",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Days",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "01",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Hours",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "01",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Minutes",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: Form(
                        key: const Key("Form"),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Title:", textAlign: TextAlign.start),
                            TextFormField(
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueGrey, width: 2.0)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                fillColor: Color.fromARGB(124, 255, 255, 255),
                                filled: true,
                                hintText: 'Ex. Travel to Brazil',
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const MyDatePicker(),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.05,
                        child: const MyCategory())
                  ],
                )
              ]),
        ),
      ),
    ));
  }
}
