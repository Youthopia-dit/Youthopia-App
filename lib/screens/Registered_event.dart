
import 'package:flutter/material.dart';

class Registered_event extends StatefulWidget {
  const Registered_event({super.key});

  @override
  State<Registered_event> createState() => _Registered_eventState();
 }

class _Registered_eventState extends State<Registered_event> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body:Container(
          decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/image 89.png'),
                fit: BoxFit.fill,

          )),


        )
      ),
    );
  }
}
