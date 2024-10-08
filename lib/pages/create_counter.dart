// ignore_for_file: prefer_const_constructors

import 'package:countdown/components/color_picker.dart';
import 'package:countdown/styles.dart';
import 'package:flutter/material.dart';

class CreateCounter extends StatefulWidget {
  const CreateCounter({super.key});

  @override
  State<CreateCounter> createState() => _CreateCounterState();
}

bool _checkvalue = false;

final _formKey = GlobalKey<FormState>();

class _CreateCounterState extends State<CreateCounter> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.backgroundColor,
          ),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        BackButton(),
                        Text(
                          "Create a counter",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: Key("Form"),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title:", textAlign: TextAlign.start),
                        TextFormField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2.0)),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            fillColor: const Color.fromARGB(124, 255, 255, 255),
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
                        Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ColorPicker()),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            children: [
                              Text("Allow negative"),
                              Checkbox(
                                value: _checkvalue,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _checkvalue = value ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
