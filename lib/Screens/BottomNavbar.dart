import 'package:flutter/material.dart';
import 'package:youthopia/Screens/hello.dart'; // Import your screen widget here

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<BottomNavbar> {
  bool isProcessing = true;
  int _selectedIndex = 0;
  static final List<Widget> _list = <Widget>[
    HelloApp(),
    HelloApp(),
    HelloApp(),
    HelloApp(),
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
    // Replace with your data loading logic
    await Future.delayed(Duration(seconds: 2)); // Simulating data loading
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
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
       
        items: const [
          
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available_rounded),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_sharp),
            label: 'Registered Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'My Profile',
            
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
