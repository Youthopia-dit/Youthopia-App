import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/colors.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      alignment: Alignment.center,
      width: 350,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) => LoadingAnimationWidget.staggeredDotsWave(
        color: CustomColors.black,
        size: 20,
      ),
      errorWidget: (context, url, error) => Image.asset(
        'Assets/fake_image.png',
        alignment: Alignment.center,
        height: 100,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
