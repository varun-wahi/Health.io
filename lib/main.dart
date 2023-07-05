import 'dart:async';

import 'package:bmi_app/BMIScoreScreen.dart';
import 'package:bmi_app/SplashScreen.dart';
import 'package:bmi_app/ui_helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'JournalScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _margin = 20.00;

  var weight_textController = TextEditingController();

  var heightInFeet_textController = TextEditingController();
  var heightInches_textController = TextEditingController();
  var bmi = 0.00;

  var message;
  var color;

  var heightFt = 0;
  var heightIn = 0;
  var weight;

  double feet = 0;
  double inches = 0;

  List<String> bmiList = [];

  Future<void> writeNewData({String? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('bmi') == null) {
      prefs.setStringList('bmi', ['0.00']);
    }
    if (value != null) {
      bmiList = prefs.getStringList('bmi')!;
      print("Retreived prefs list: $bmiList");
      bmiList.add(value!);
      prefs.setStringList('bmi', bmiList);
      print("Added New Item: $value");
      print("Updated BMI List:$bmiList");
    } else {
      bmiList = prefs.getStringList('bmi')!;

      print("No Values Inserted");
      print("Updated BMI List:$bmiList");
    }
  }

  void calculateBMI(double _weight, int _heightFt, int _heightInches) {
    weight = _weight;
    heightFt = _heightFt;
    heightIn = _heightInches;
    var heightInInches = (heightFt * 12) + heightIn;
    var heightInMeters = (heightInInches * 2.54) / 100;
    bmi = weight / (heightInMeters * heightInMeters);
  }

  void BMIStats(double bmi) {
    if (bmi < 18.5) {
      message = "You are Underweight.\nHealth Risk is Minimum.";
      color = Colors.yellow;
    } else if (bmi <= 24.9 && bmi >= 18.5) {
      message = "You are Normal Weighted.\nHealth Risk is Minimum.";
      color = Colors.green;
    } else if (bmi <= 29.9 && bmi > 24.9) {
      message = "You are OverWeight.\nHealth Risk is Increased.";
      color = const Color.fromARGB(255, 255, 131, 93);
    } else if (bmi > 29.9 && bmi <= 35.9) {
      message = "You are Obese.\nHealth Risk is High.";
      color = Colors.deepOrange;
    } else {
      message = "You are Severely Obese.\nHealth Risk is Very High.";
      color = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // backgroundColor: Colors.deepPurpleAccent,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Center(
      //     child: Text(
      //       "Home",
      //       style: style1(
      //         size: 31,
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(_margin),
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(top: 50, bottom: 50),
          width: MediaQuery.sizeOf(context).width,
          // height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Calculate Your BMI!",
                style: style1(
                  fontWeight: FontWeight.bold,
                  size: 35,
                ),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Text(
                    "Weight (In KGs)",
                    style: style1(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 3,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      controller: weight_textController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Height",
                    style: style1(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          // width: 120,
                          child: Column(
                            children: [
                              Text(
                                "Feet",
                                style: style1(),
                              ),
                              TextField(
                                onChanged: (value) {
                                  var val = int.parse(
                                      heightInFeet_textController.text
                                          .toString());
                                  if (val > 10) {
                                    val = 10;
                                    heightInFeet_textController.text =
                                        val.toString();
                                  }
                                  setState(() {
                                    feet = double.parse(val.toString());
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: heightFt.toString(),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                controller: heightInFeet_textController,
                                textAlign: TextAlign.center,
                              ),
                              Slider(
                                  min: 0,
                                  max: 10,
                                  divisions: 10,
                                  value: feet,
                                  onChanged: (value) {
                                    setState(() {
                                      feet = double.parse(value.toString());
                                      heightInFeet_textController.text =
                                          int.parse(feet.toStringAsFixed(0))
                                              .toString();
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          // width: 120,
                          child: Column(
                            children: [
                              Text(
                                "Inches",
                                style: style1(),
                              ),
                              TextField(
                                onChanged: (value) {
                                  var val = int.parse(
                                      heightInches_textController.text
                                          .toString());
                                  if (val > 11) {
                                    val = 11;
                                    heightInches_textController.text =
                                        val.toString();
                                  }

                                  setState(() {
                                    inches = double.parse(val.toString());
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: heightIn.toString(),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                controller: heightInches_textController,
                                textAlign: TextAlign.center,
                              ),
                              Slider(
                                  min: 0,
                                  max: 11,
                                  divisions: 11,
                                  value: inches,
                                  onChanged: (value) {
                                    setState(() {
                                      inches = double.parse(value.toString());
                                      heightInches_textController.text =
                                          int.parse(inches.toStringAsFixed(0))
                                              .toString();
                                    });
                                  }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(),
              ElevatedButton(
                onPressed: () {
                  calculateBMI(
                    double.parse(weight_textController.text.toString()),
                    int.parse(heightInFeet_textController.text.toString()),
                    int.parse(
                      heightInches_textController.text.toString(),
                    ),
                  );

                  ///////////////////////////////////////
                  BMIStats(bmi);
                  writeNewData(value: bmi.toStringAsFixed(2));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIScoreScreen(
                          bmi: bmi,
                          message: message,
                          color: color,
                        ),
                      ));
                  setState(() {});
                },
                child: Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  writeNewData();

                  if (bmiList.length != 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JournalScreen(bmiList: bmiList),
                      ),
                    );
                  } else {
                    Timer(
                      const Duration(milliseconds: 200),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  JournalScreen(bmiList: bmiList)),
                        );
                        print("Wait Over");
                      },
                    );
                  }
                  setState(() {});
                },
                child: Text('View History'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  

    
// class CustomContainer extends StatelessWidget {
//   Color? color;
//   double? margin;
//   int flex = 1;
//   String text = '';

//   CustomContainer({
//     String iText = '',
//     int iFlex = 1,
//     Color iColor = Colors.white,
//     required double iMargin,
//   }) {
//     this.text = iText;
//     this.flex = iFlex;
//     this.color = iColor;
//     this.margin = iMargin;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: flex,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => JournalScreen(
//                         bmi: bmi,
//                         heightFt: heightFt,
//                         heightIn: heightIn,
//                         weight: weight,
//                       )),
//             );
//           },
//           child: Card(
//             elevation: 9,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
//             color: this.color,
//             margin: EdgeInsets.only(bottom: double.parse(margin.toString())),
//             child: Center(child: Text(text)),
//           ),
//         ),
//       ),
//     );
//   }
// }
