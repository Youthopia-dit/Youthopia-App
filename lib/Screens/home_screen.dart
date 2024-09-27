import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youthopia/data/data_instance.dart';
import 'package:youthopia/screens/single_event_screen.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import 'package:youthopia/widgets/cached_image.dart';
import 'package:youthopia/widgets/live_event_card.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YouthopiaAppbar().paddingForOnly(top: 30),
            CarouselSlider(
              items: Data.carouselImages.map((element) {
                return CachedImage(imageUrl: element);
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeFactor: 0.5,
                height: 200,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'FEATURED EVENTS',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              items: Data.featured.map((element) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SingleEventScreen(eventDetails: element)));
                  },
                  child: LiveEventCard(
                    eventDetails: element,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 200,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'SPONSORS',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Data.sponsorImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.network(Data.sponsorImages[index]);
                  }).wrapCenter(),
            ).paddingForOnly(bottom: 50)
          ],
        ).paddingWithSymmetry(horizontal: 20),
      ),
    );
  }
}
