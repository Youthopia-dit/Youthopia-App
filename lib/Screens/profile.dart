import 'package:flutter/cupertino.dart';
import 'package:youthopia/utils/colors.dart';

import '../widgets/background_scaffold.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return BackgroundScaffold (child: Container(
      height:100,
          width: 100,
      decoration: BoxDecoration(color: CustomColors.Black40,
          borderRadius: BorderRadius.circular(25)),
    ),
    );

        }
}
