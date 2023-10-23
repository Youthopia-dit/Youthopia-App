import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youthopia/Screens/form_screen.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

class SingleEventScreen extends StatelessWidget {
  const SingleEventScreen({super.key, required this.eventDetails});
  final EventDetails eventDetails;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: ListView(physics: const BouncingScrollPhysics(), children: [
        const YouthopiaAppbar(),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            eventDetails.poster,
            errorBuilder: (context, exception, stacktrace) {
              return Image.asset(
                'Assets/fake_image.png',
                alignment: Alignment.center,
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              );
            },
            alignment: Alignment.center,
            height: 200,
            width: 350,
            fit: BoxFit.cover,
          ),
        ).paddingForOnly(bottom: 20, left: 16, right: 16),
        Text(
          eventDetails.eventName,
          style: const TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ).paddingWithSymmetry(horizontal: 16),
        Row(
          children: [
            const Icon(
              Icons.watch_later_outlined,
              size: 18,
              color: Colors.white,
            ).paddingForOnly(left: 24, top: 15, right: 5),
            Expanded(
              child: Text("${eventDetails.startTime} - ${eventDetails.endTime}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )).paddingForOnly(top: 15),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.calendar_month,
              size: 18,
              color: Colors.white,
            ).paddingForOnly(left: 24, top: 15, right: 5),
            Expanded(
              child: Text(eventDetails.date,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )).paddingForOnly(top: 15),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 18,
              color: Colors.white,
            ).paddingForOnly(left: 24, top: 15, right: 5),
            Expanded(
              child: Text(eventDetails.venue,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )).paddingForOnly(top: 15),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.money,
              size: 18,
              color: Colors.white,
            ).paddingForOnly(left: 24, top: 15, right: 5),
            Expanded(
              child: Text("${eventDetails.feesdit} for DIT students",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )).paddingForOnly(top: 15),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.money,
              size: 18,
              color: Colors.white,
            ).paddingForOnly(left: 24, top: 15, right: 5),
            Expanded(
              child: Text("${eventDetails.feesnondit} for non-DIT students",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )).paddingForOnly(top: 15),
            ),
          ],
        ),
        const Text("Description",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            )).paddingForOnly(left: 16, top: 15, right: 5),
        Row(
          children: [
            Expanded(
              child: Text(eventDetails.description,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
          ],
        ).paddingForOnly(left: 24, top: 10, right: 5, bottom: 10),
        (eventDetails.rules.isEmpty)
            ? const SizedBox()
            : const Text("Rules",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                )).paddingForOnly(left: 16, top: 15, right: 5),
        (eventDetails.rules.isEmpty)
            ? const SizedBox()
            : ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: eventDetails.rules.length,
                itemBuilder: (context, index) {
                  return Text(eventDetails.rules[index],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )).paddingForOnly(left: 24, right: 24, bottom: 10);
                }),
        eventDetails.bots.isEmpty
            ? const SizedBox()
            : const Row(children: [
                Text("Bots ",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ]).paddingForOnly(left: 16, top: 15, right: 5),
        (eventDetails.bots.isEmpty)
            ? const SizedBox()
            : ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: eventDetails.bots.length,
                itemBuilder: (context, index) {
                  return Text(eventDetails.bots[index],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )).paddingForOnly(left: 24, right: 24);
                }),
        SizedBox(
          width: 300.0,
          height: 40.0,
          child: OutlinedButton(
            onPressed: () async {
              if(eventDetails.form != null) {
                final uri = Uri.parse(eventDetails.form!);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormScreen(event: eventDetails)),
                );
              }
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Register',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ).paddingForOnly(right: 10),
              const Icon(
                Icons.arrow_right_alt_sharp,
                color: Colors.black,
              )
            ]),
          ),
        ).paddingForOnly(top: 20, bottom: 40, left: 20, right: 20),
      ]),
    );
  }
}