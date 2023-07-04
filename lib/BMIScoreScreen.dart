import 'package:bmi_app/ui_helper/utils.dart';
import 'package:flutter/material.dart';

class BMIScoreScreen extends StatelessWidget {
  var _bmi;
  String? _message = '';
  Color? _color;

  BMIScoreScreen(
      {double? bmi,
      String message = "Healthy",
      Color color = Colors.deepPurpleAccent}) {
    _bmi = bmi;
    _message = message;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.only(top: 31, bottom: 31),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(21),
          color: _color,
          // gradient: LinearGradient(
          //     colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          //     begin: Alignment.bottomLeft,
          //     end: Alignment.topRight)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: style1(
                      size: 41,
                      fontColor: Colors.white,
                    ),
                    children: [
                      TextSpan(text: "Your BMI Score is: "),
                      TextSpan(
                        text: "${_bmi.toStringAsFixed(2)}",
                        style: style1(
                          family: 'Caprasimo',
                          style: FontStyle.italic,
                          size: 45,
                          fontColor: Colors.white,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "$_message",
                style: style1(
                  size: 25,
                  fontColor: Colors.white,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
