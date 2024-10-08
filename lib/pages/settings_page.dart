import 'package:countdown/styles.dart';
import 'package:countdown/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  final _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Settings"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(11)),
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 12,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Time Zone"),
                        ],
                      ),
                      Align(
                        child: DropdownMenu(
                            width: 130,
                            enableFilter: true,
                            requestFocusOnTap: true,
                            hintText: "Patata",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                  value: "GMT+2 (Spain)",
                                  label: "GMT+2 (Spain)"),
                              DropdownMenuEntry(
                                  value: "GMT+3 (Spain)",
                                  label: "GMT+3 (Spain)"),
                              DropdownMenuEntry(
                                  value: "GMT+4 (Spain)",
                                  label: "GMT+4 (Spain)"),
                              DropdownMenuEntry(
                                  value: "GMT+5 (Spain)",
                                  label: "GMT+5 (Spain)"),
                              DropdownMenuEntry(
                                  value: "GMT+6 (Spain)",
                                  label: "GMT+6 (Spain)"),
                              DropdownMenuEntry(
                                  value: "GMT+7 (Spain)",
                                  label: "GMT+7 (Spain)"),
                              DropdownMenuEntry(
                                  value: "GMT+8 (Spain)",
                                  label: "GMT+8 (Spain)"),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(11)),
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 9,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.language),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Language"),
                        ],
                      ),
                      DropdownMenu(dropdownMenuEntries: [
                        DropdownMenuEntry(value: "value", label: "ffsdf")
                      ])
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(11)),
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 12,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.dark_mode),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Dark Mode"),
                        ],
                      ),
                      Switch(
                          // thumb color (round icon)
                          activeColor: Colors.amber,
                          activeTrackColor: Colors.cyan,
                          inactiveThumbColor: Colors.blueGrey,
                          inactiveTrackColor: Colors.grey,
                          splashRadius: 50.0,
                          // boolean variable value
                          value:
                              Provider.of<ThemeProvider>(context).switchValue,
                          // changes the state of the switch
                          onChanged: (bool value) {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .updateSwitchValue(value);
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme(); /* setState(() => _switchValue = value), */
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                endIndent: 100,
                indent: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(11)),
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 12,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thumb_up_alt_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Rate the app"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(11)),
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 12,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.highlight_remove_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Remove ads"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                endIndent: 100,
                indent: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text("About"),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text("Privacy policy"),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text("Terms of service"),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text("Change privacy preferences"),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
