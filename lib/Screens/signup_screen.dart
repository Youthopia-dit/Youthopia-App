import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/rectangle%20black.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BackgroundScaffold(
            child: Center(
                child: InkWellRectangle(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignupHeading(),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Name',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28))),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: 209.0, // Set the width to 209
                  height: 36.0, // Set the height to 36
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28))),
                  ),
                ),
              ),
            ],
          ),
        ))),
      ),
    );
  }
}

class SignupHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 13,
            color: Colors.transparent, // Changed color to transparent
            child: Center(
              child: Text(
                'Sign Up', // Added "Sign Up" text
                style: TextStyle(
                  fontSize: 20.0, // Changed font size
                  color: Colors.white, // Changed text color to white
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 13,
            color: Colors.transparent, // Changed color to transparent
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent, // Color of the first container
                    child: Image.asset(
                        'Assets/Group 6481.png'), // Add your image asset
                  ),
                ),
                Expanded(
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Personal',
                          style: TextStyle(
                              color: Colors.white), // Text color white
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          'University',
                          style: TextStyle(
                              color: Colors.white), // Text color white
                        ),
                      ),
                    ],
                  ) // Color of the second container
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
