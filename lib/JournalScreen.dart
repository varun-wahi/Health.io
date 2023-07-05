import 'dart:collection';

import 'package:bmi_app/ui_helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalScreen extends StatelessWidget {
  List<String> _bmiList = [];

  JournalScreen({required List<String> bmiList}) {
    _bmiList = bmiList;
  }

  var entryController = TextEditingController();
  // Map<int, double> entries = HashMap();

  Color BMIStats(String bmi_string) {
    var bmi = double.parse(bmi_string);
    var color;
    if (bmi < 18.5) {
      color = Colors.yellow;
    } else if (bmi <= 24.9 && bmi >= 18.5) {
      color = Colors.green;
    } else if (bmi <= 29.9 && bmi > 24.9) {
      color = const Color.fromARGB(255, 255, 131, 93);
    } else if (bmi > 29.9 && bmi <= 35.9) {
      color = Colors.deepOrange;
    } else {
      color = Colors.red;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        body: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                "History",
                style: style1(size: 45, fontWeight: FontWeight.w400),
              ),
              Divider(),
              Expanded(
                flex: 4,
                child: Container(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.black,
                              size: 12,
                            ),
                            Text(
                              "${_bmiList[_bmiList.length - index - 1]}",
                              style:
                                  style1(size: 30, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.circle,
                              color: BMIStats(
                                  _bmiList[_bmiList.length - index - 1]),
                              size: 25,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: _bmiList.length - 1,
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
