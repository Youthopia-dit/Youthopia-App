import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

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
               child: Column(
                 children: <Widget>[
                   Image.asset('Assets/dance.png'),
                   Image.asset('Assets/youthopia_logo2.png'),
                   Container(
                     width: 300.0,
                     height: 100.0,
                       child: Column(
                           children: <Widget>[
                            Text('NAME OF THE EVENT'),
                             Row(
                           children:[
                             Text('Venue'),
                             Text('Ticket ID'),

                           ] ,),
                             Text('Date'),
                             

                           ]),
                   ),
                   Image.asset('Assets/Line.png')
                 ]
               ),
             ).paddingForOnly(top: 80),
          ],
        ),
      ),
    );
  }
}