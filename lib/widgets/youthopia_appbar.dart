import 'package:flutter/material.dart';

AppBar YouthopiaAppbar() {
  return AppBar(
    title: Image.asset('Assets/youthopia_logo.png'),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
  );
}
