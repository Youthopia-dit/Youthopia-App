import 'package:flutter/material.dart';
import 'package:youthopia/data/models/ticket_model.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/widgets/black_container.dart';

class TicketContainer extends StatelessWidget 
{
  const TicketContainer({super.key, required this.ticket});
  final TicketDetails ticket;
  @override
  Widget build(BuildContext context) 
  {
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
            width: 400,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(ticket.event.eventName, style: TextStyle(
            color: CustomColors.white,
            fontSize: 20,
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(ticket.teamName, style: TextStyle(
            color: CustomColors.white,
            fontSize: 20,
          ),),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(ticket.event.date, style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                    ),),
            ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(ticket.event.startTime, style: TextStyle(
            color: CustomColors.white,
            fontSize: 20
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(ticket.event.endTime, style: TextStyle(
            color: CustomColors.white,
            fontSize: 20,
          ),),
        ),
          ],
        ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(ticket.event.venue, style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 20,
                  ),),
             ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(ticket.ticketId, style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 20,
                  ),),
                ),
         ],
    ));
  }
}
