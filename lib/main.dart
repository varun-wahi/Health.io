import 'package:bmi_app/BMIScoreScreen.dart';
import 'package:bmi_app/SplashScreen.dart';
import 'package:bmi_app/ui_helper/utils.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Center(
      //     child: Text(
      //       "BMI Calculator",
      //       style: style1(
      //         size: 31,
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(_margin),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                    iMargin: _margin,
                  ),
                  CustomContainer(
                    iMargin: _margin,
                  ),
                  CustomContainer(
                    iMargin: _margin,
                  ),
                  CustomContainer(
                    iMargin: _margin,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(30),
                // margin: EdgeInsets.only(top: margin),
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
                    ElevatedButton(
                      onPressed: () {
                        var weight =
                            int.parse(weight_textController.text.toString());
                        var heightFt = int.parse(
                            heightInFeet_textController.text.toString());
                        var heightIn = int.parse(
                            heightInches_textController.text.toString());
                        var heightInInches = (heightFt * 12) + heightIn;
                        var heightInMeters = (heightInInches * 2.54) / 100;
                        bmi = weight / (heightInMeters * heightInMeters);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BMIScoreScreen(bmi),
                            ));
                        setState(() {});
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  Color? color;
  double? margin;
  int flex = 1;

  CustomContainer({
    int iFlex = 1,
    Color iColor = Colors.white,
    required double iMargin,
  }) {
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
        child: Container(
          margin: EdgeInsets.only(bottom: double.parse(margin.toString())),
          decoration: BoxDecoration(
              color: this.color, borderRadius: BorderRadius.circular(21)),
        ),
      ),
    );
  }
}
