import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EventPage(),
    );
  }
}

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Event Logo
                Image.asset(
                  'assets/event_logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),

                // Event Title
                const Text(
                  'Technical Event',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Event Poster
                Image.asset(
                  'assets/event_poster.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                // Event Details
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location:'),
                        Text('Vedanta Hall'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date:'),
                        Text('21/10/2022'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time:'),
                        Text('13:07'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Event Description
                const Text(
                  'A fun parliament session where groups will debate on some entertaining topics. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Event Coordinators
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event Co-Ordinator:'),
                    Text('Joestar Jotaro'),
                    SizedBox(height: 10),
                    Text('Over All Head:'),
                    Text('Dio Brando'),
                  ],
                ),
                const SizedBox(height: 20),

                // Register Button
                ElevatedButton(
                  onPressed: () {
                    // Add your registration logic here
                  },
                  child: const Text('Register Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
