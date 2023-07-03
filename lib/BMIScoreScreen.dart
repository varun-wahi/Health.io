import 'package:bmi_app/ui_helper/utils.dart';
import 'package:flutter/material.dart';

class BMIScoreScreen extends StatelessWidget {
  var _bmi;
  BMIScoreScreen(double bmi) {
    _bmi = bmi;
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
            // color: Colors.deepPurpleAccent,
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: Center(
          child: RichText(
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
            // "Your BMI Score is: ${_bmi.toStringAsFixed(2)}",
            // style: style1(
            //   family: 'Caprasimo',
            //   style: FontStyle.italic,
            //   size: 45,
            //   fontColor: Colors.white,
            // ),
          ),
        ),
      ),
    );
  }
}
