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
          child: TextInputWidget(),
        ))),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Name'),
        SizedBox(height: 10),
        _buildTextField('Email'),
        SizedBox(height: 10),
        _buildTextField('Phone'),
        SizedBox(height: 10),
        _buildTextField('Gender'),
      ],
    );
  }

  Widget _buildTextField(String label) {
    return Container(
      width: 209.0,
      height: 37.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
