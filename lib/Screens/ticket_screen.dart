import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';

class TS extends StatelessWidget {
  const TS({
    super.key,
    this.event,
    this.venue,
    this.id,
    this.date,
  });
  final String? event;
  final String? venue;
  final String? id;
  final String? date;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: 300.0,
              height: 550.0,
              decoration: BoxDecoration(
                color: CustomColors.black.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(children: <Widget>[
                Image.asset('Assets/dance.png'),
                Image.asset('Assets/youthopia_logo2.png'),
                Container(
                  width: 500.0,
                  height: 100.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'NAME OF EVENT',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: CustomColors.white, fontSize: 15),
                        ),
                        Row(
                          children: [
                            Text('Venue',
                                style: TextStyle(
                                  color: CustomColors.white,
                                )),
                            Text('Ticket ID',
                                style: TextStyle(
                                  color: CustomColors.white,
                                )).paddingForOnly(left: 60),
                          ],
                        ).paddingForOnly(top: 10, bottom: 10),
                        Text('Date',
                            style: TextStyle(
                              color: CustomColors.white,
                            )),
                      ]).paddingForOnly(left: 20),
                ),
                Image.asset('Assets/Line.png', width: 250),
                Image.asset(
                  'Assets/qr.png',
                  width: 150.0,
                  height: 150.0,
                ).paddingForOnly(top: 5),
              ]),
            ).paddingForOnly(top: 80),
          ],
        ),
      ),
    );
  }
}
