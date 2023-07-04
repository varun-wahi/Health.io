import 'dart:collection';

import 'package:bmi_app/ui_helper/utils.dart';
import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  var entryController = TextEditingController();
  // Map<int, double> entries = HashMap();
  List<double> bmiList = [
    18,
    20,
    19.2,
    21.3,
    34,
    34,
    23,
    23,
    34,
    45,
    56,
    56,
    45,
    342,
    23,
    132,
    12,
    23,
    34
  ];

  Color BMIStats(double bmi) {
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
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Current height",
                            style: style1(
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(),
                          Text(
                            "6ft 3in",
                            style: style1(
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Current Weight",
                            style: style1(
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(),
                          Text(
                            "75 KGs",
                            style: style1(
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
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
                      child: SizedBox(
                        // height: 300,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              height: 120,
                              decoration: BoxDecoration(
                                color: BMIStats(bmiList[index]),
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  Text(
                                    "${bmiList[index]}",
                                    style: style1(
                                        fontColor: Colors.white,
                                        size: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: bmiList.length,
                          separatorBuilder: (context, index) => Divider(
                            thickness: 0,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
