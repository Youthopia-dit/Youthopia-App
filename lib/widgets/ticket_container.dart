import 'package:flutter/material.dart';
import 'package:youthopia/data/models/ticket_model.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/widgets/black_container.dart';

class TicketContainer extends StatelessWidget {
  const TicketContainer({super.key, required this.ticket});
  final TicketDetails ticket;
  @override
  Widget build(BuildContext context) {
    return BlackContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          child: Image.network(
            ticket.event.poster,
            errorBuilder: (context, exception, stacktrace) {
              return Image.asset(
                'Assets/fake_image.png',
                alignment: Alignment.center,
                height: 200,
                width: 350,
                fit: BoxFit.cover,
              );
            },
            alignment: Alignment.center,
            height: 200,
            width: 350,
            fit: BoxFit.cover,
          ),
        ),
        Text(ticket.event.eventName, style: const TextStyle(
          color: CustomColors.white,
          fontSize: 20
        ),)
      ],
    ));
  }
}
