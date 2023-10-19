import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class YouthopiaSearchBar extends StatefulWidget {
  const YouthopiaSearchBar({super.key});

  @override
  State<YouthopiaSearchBar> createState() => _YouthopiaSearchBarState();
}

class _YouthopiaSearchBarState extends State<YouthopiaSearchBar> {
  bool isSearchActive = false;

  Widget searchInactive() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'Assets/youthopia_logo.png',
          width: 200,
        ).paddingForOnly(left: 20),
        IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = true;
              });
            },
            icon: const Icon(
              Icons.search,
              color: CustomColors.white,
              size: 32,
            )).paddingForOnly(right: 20)
      ],
    );
  }

  Widget searchActive() {
    return TextField(
      style: const TextStyle(
        color: CustomColors.white
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 25),
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: CustomColors.white, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
              const BorderSide(color: CustomColors.white, width: 2)),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = false;
              });
            },
            icon: const Icon(
              Icons.search,
              color: CustomColors.white,
              size: 32,
            ),
          )),
    ).paddingForOnly(left: 20, right: 20, bottom: 20);
  }

  @override
  Widget build(BuildContext context) {
    return (isSearchActive) ? searchActive() : searchInactive();
  }
}
