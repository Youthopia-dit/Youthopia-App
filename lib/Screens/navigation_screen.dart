import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
//import 'package:youthopia/screens/empty_screen.dart';
import 'package:youthopia/screens/profile_screen.dart';
import 'package:youthopia/utils/colors.dart';

import 'event_list_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<BottomNavbar> {
  bool isProcessing = true;
  int _selectedIndex = 0;
  static final List<Widget> _list = <Widget>[
    Placeholder(),
    EventListScreen(),
    EventListScreen(type: "my",),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    setState(() {
      isProcessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: (isProcessing)
            ? const CircularProgressIndicator()
            : _list.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.backgroundGrey,
        selectedItemColor: CustomColors.glowBlue,
        unselectedItemColor: CustomColors.white,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: GlowIcon(Icons.home,
                glowColor: _selectedIndex == 0 ? CustomColors.glowBlue : null),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: GlowIcon(Icons.event_available_rounded, glowColor: _selectedIndex == 1 ? CustomColors.glowBlue : null),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: GlowIcon(Icons.event_sharp, glowColor: _selectedIndex == 2 ? CustomColors.glowBlue : null),
            label: 'My Events',
          ),
          BottomNavigationBarItem(
            icon: GlowIcon(Icons.person_pin, glowColor: _selectedIndex == 4 ? CustomColors.glowBlue : null),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
