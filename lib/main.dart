import 'package:bmi_app/BMIScoreScreen.dart';
import 'package:bmi_app/SplashScreen.dart';
import 'package:bmi_app/ui_helper/utils.dart';
import 'package:flutter/material.dart';

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
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
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
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: weight_textController,
                    textAlign: TextAlign.center,
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
                        flex: 2,
                        child: SizedBox(
                          // width: 120,
                          child: Column(
                            children: [
                              Text(
                                "Feet",
                                style: style1(),
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                controller: heightInFeet_textController,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          // width: 120,
                          child: Column(
                            children: [
                              Text(
                                "Inches",
                                style: style1(),
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                controller: heightInches_textController,
                                textAlign: TextAlign.center,
                              ),
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
                  var weight = int.parse(weight_textController.text.toString());
                  var heightFt =
                      int.parse(heightInFeet_textController.text.toString());
                  var heightIn =
                      int.parse(heightInches_textController.text.toString());
                  var heightInInches = (heightFt * 12) + heightIn;
                  var heightInMeters = (heightInInches * 2.54) / 100;
                  bmi = weight / (heightInMeters * heightInMeters);

                  ///////////////////////////////////////
                  BMIStats(bmi);
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
                  var weight = int.parse(weight_textController.text.toString());
                  var heightFt =
                      int.parse(heightInFeet_textController.text.toString());
                  var heightIn =
                      int.parse(heightInches_textController.text.toString());
                  var heightInInches = (heightFt * 12) + heightIn;
                  var heightInMeters = (heightInInches * 2.54) / 100;
                  bmi = weight / (heightInMeters * heightInMeters);

                  ///////////////////////////////////////
                  BMIStats(bmi);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JournalScreen()),
                  );
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

class CustomContainer extends StatelessWidget {
  Color? color;
  double? margin;
  int flex = 1;
  String text = '';

  CustomContainer({
    String iText = '',
    int iFlex = 1,
    Color iColor = Colors.white,
    required double iMargin,
  }) {
    this.text = iText;
    this.flex = iFlex;
    this.color = iColor;
    this.margin = iMargin;
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JournalScreen()),
            );
          },
          child: Card(
            elevation: 9,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
            color: this.color,
            margin: EdgeInsets.only(bottom: double.parse(margin.toString())),
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}
