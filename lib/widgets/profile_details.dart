import 'package:flutter/cupertino.dart';
import 'package:youthopia/utils/widget_extensions.dart';

import '../utils/colors.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key,required this.domain,required this.value});
final String domain;
final String value;
  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width-70,

      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 2,color: CustomColors.white)
          )

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.domain,
            style: TextStyle(fontSize: 15, color: CustomColors.white ),
          ).paddingForOnly(top: 10,left: 5),

          Text(
            widget.value,
            style: TextStyle(fontSize: 20, color: CustomColors.white),
          ).paddingForOnly(top: 10,left: 10,bottom: 10),

          // Image.asset('Assets/Rectangle.png',)

        ],
      ),
    );
  }
}
