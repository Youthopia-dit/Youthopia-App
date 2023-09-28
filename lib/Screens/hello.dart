import 'package:flutter/material.dart';

void main() {
  runApp(HelloApp());
}

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelloScreen(),
    );
  }
}

class HelloScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            'Hello, F l u t t e r!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
