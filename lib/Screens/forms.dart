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
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: InkWellRectangle(
                child: Column(
                  
                  children: [
                    Text("Personal Details",
                    
                     style: TextStyle(fontSize: 20),
                     ),
                    SizedBox(height: 40),
                   
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: DefaultTabController(
              length: 2, 
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Teams'),
                      Tab(text: 'Individual'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      children: [
                       
                        Column(
                          children: [
                            Text("Team Name"),
                            TextField(), 
                            Text("Team Leader's SAP ID"),
                            TextField(), 
                          ],
                        ),
                       
                        Column(
                          children: [
                           
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
