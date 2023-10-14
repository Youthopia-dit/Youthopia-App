import 'package:flutter/material.dart';

class HorizontalLogo extends StatelessWidget {
  const HorizontalLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('Assets/naac.png'),
          Image.asset('Assets/DIT LOGO WHITE.png'),
          Image.asset('Assets/25_years_logo.png'),

        ]);
  }
}
