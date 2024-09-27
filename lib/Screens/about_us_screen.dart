import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/about_container.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
        ),
        const YouthopiaAppbar().paddingForOnly(top: 50),
        Container(
                child:
                    Image.asset('Assets/Group 6760.png').paddingForOnly(top: 0))
            .paddingForOnly(bottom: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.black.withOpacity(0.8)),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutHeading(
                  title: 'Development Team',
                  type: false,
                ),
                AboutContainer(
                  name: 'Vijayant Singh',
                  branch: 'BTCSE',
                  year: '3RD',
                ),
                AboutContainer(
                  name: 'Pratik Singh',
                  branch: 'BTCSE',
                  year: '3RD',
                ),
                AboutContainer(
                  name: 'Mudit Jain',
                  branch: 'BTCSE',
                  year: '3RD',
                ),
                AboutContainer(
                  name: 'Amisha Tandon',
                  branch: 'BTCSE',
                  year: '3RD',
                ),
                AboutContainer(
                  name: 'Garima Agrawal',
                  branch: 'BTCSE',
                  year: '2ND',
                ),
                AboutContainer(
                  name: 'Shivangi Rajput',
                  branch: 'BTCSE',
                  year: '2ND',
                ),
                AboutContainer(
                  name: 'Pragati Aggarwal',
                  branch: 'BTCSE',
                  year: '2ND',
                ),
                AboutContainer(
                  name: 'Anushka Gupta',
                  branch: 'BTCSE',
                  year: '2ND',
                ),
                SizedBox(
                  height: 20,
                ),
                AboutHeading(
                  title: 'Design team',
                  type: false,
                ),
                AboutContainer(
                  name: 'Saumya Negi',
                  branch: 'B. Des (UX)',
                  year: '2ND',
                ),
                AboutContainer(
                  name: 'Divya Dvivedy',
                  branch: 'B. Des (UX)',
                  year: '2ND',
                ),
                AboutContainer(
                  name: 'Shristi Singhal',
                  branch: 'B. Des (UX)',
                  year: '2ND',
                ),
                AboutContainer(
                  name: 'Ayush Goswami',
                  branch: 'B. Des (UX)',
                  year: '2ND',
                ),
                SizedBox(
                  height: 20,
                )
              ]).paddingWithSymmetry(horizontal: 20, vertical: 4),
        )
      ]),
    ));
  }
}
