import 'package:flutter/material.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/rectangle_black.dart';
import '../utils/colors.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScaffold(
        child: Stack(
          children: [
            Center(
              child: DefaultTabController(
                length: 2,
                child: Container(
                  width: 300,
                  height: 700,
                  child: InkWellRectangle(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:60.0),
                                child: Text(
                                  'Participants details',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(left:45.0),
                                child: Text('X',style: TextStyle(decorationThickness: 100,color: Colors.white),),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            color: Colors.transparent,
                            child: Image.asset('Assets/DITU_Highres_WHITE.png'),
                          ),
                          SizedBox(height: 10),
                          TabBar(
                            labelColor: Colors.blue,
                            indicatorColor: Colors.blue,
                            dividerColor: Colors.white10,
                            tabs: [
                              Tab(
                                text: 'Teams',
                              ),
                              Tab(
                                text: 'Individual',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 140, 0),
                                        child: Text(
                                          "Team Name",
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'Enter Team Name',
                                            labelStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.05),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                                        child: Text(
                                          "Team Leader's SAP ID",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'Enter Leaders SAP ID',
                                            labelStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.05),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                                        child: Text(
                                          "Enter Your Team Size",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CustomSquareBox(
                                              text: "-",
                                              onPressed: decrementCounter,
                                            ),
                                            CustomSquareBox(
                                              text: counter.toString(),
                                            ),
                                            CustomSquareBox(
                                              text: "+",
                                              onPressed: incrementCounter,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        child: Text(
                                          "Team Member Name1",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'Enter Name',
                                            labelStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.05),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        child: Text(
                                          "Team Leader's Phone Number",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'Enter Leaders phone',
                                            labelStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.05),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                        ).copyWith(
                                          fixedSize: MaterialStateProperty.all(
                                            Size(280, 50),
                                          ),
                                        ),
                                        child: Text(
                                          'Pay Now',
                                          style: TextStyle(
                                            color: Colors.black, 
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Enter Your Name',
                                          labelStyle: TextStyle(color: Colors.white),
                                          fillColor: Colors.white.withOpacity(0.05),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox (height: 10),
                                      Text(
                                        "SAP ID",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Enter Your SAP ID',
                                          labelStyle: TextStyle(color: Colors.white),
                                          fillColor: Colors.white.withOpacity(0.05),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Phone Number:",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Enter your phone number',
                                          labelStyle: TextStyle(color: Colors.white),
                                          fillColor: Colors.white.withOpacity(0.05),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                        ).copyWith(
                                          fixedSize: MaterialStateProperty.all(
                                            Size(280, 50),
                                          ),
                                        ),
                                        child: Text(
                                          'Pay Now',
                                          style: TextStyle(
                                            color: Colors.black, 
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSquareBox extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  CustomSquareBox({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}