import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  var entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(30),
          color: Colors.deepPurple[100],
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: entryController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.sports_gymnastics),
                    hintText: "Enter Text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
