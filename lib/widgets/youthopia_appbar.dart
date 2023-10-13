import 'package:flutter/material.dart';

SliverAppBar YouthopiaAppbar() {
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Image.asset('Assets/youthopia_logo.png',
    width: 200,),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
  );
}
