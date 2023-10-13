import 'package:flutter/material.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import '../utils/colors.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Container(
        decoration: BoxDecoration(
            color: CustomColors.Black40,
            borderRadius: BorderRadius.circular(25)
            ), 
          child: Column(
             children: [
                  Text('hello'),
                  Text('hello')
             ],
          ),   
      )  
    );
  }
}