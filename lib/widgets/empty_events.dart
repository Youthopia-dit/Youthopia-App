import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class EmptyEventScreen extends StatelessWidget {
  const EmptyEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('Assets/no_events.png'),
        const Text(
          'Oh! You\'re not registered for any events.',
          style: TextStyle(
            color: CustomColors.white,
            fontSize: 20,
          ),
        ).paddingForOnly(top: 20),
        SizedBox(
          width: 250.0,
          height: 40.0,
          child: OutlinedButton(
            onPressed: () {
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
            child: const Text(
              'Register now for event',
              style: TextStyle(color: CustomColors.black, fontSize: 20),
            ),
          ),
        ).paddingForOnly(top: 20),
      ],
    );
  }
}
