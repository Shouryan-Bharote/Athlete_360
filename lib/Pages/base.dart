import 'package:athlete_360/Widgets/glow_button_updated.dart';
import 'package:athlete_360/Widgets/customNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          extendBody: true,
          appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  HugeIcons.strokeRoundedLocation05,
                  color: Color.fromRGBO(255, 49, 49, 1),
                  size: 25,
                ),
                SizedBox(width: 6),
                Text(
                  "Pune",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/57899051?v=4',
              ),
            ),
          ],
        ),
      ),
          body: Column(
            children: [
              // The Search Bar
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(42, 41, 41, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Color.fromRGBO(255, 49, 49, 1)),
                    SizedBox(width: 10),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 49, 49, 1),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // Gradient Buttons
              Column(
                children: [
                  // Book a Coach btn 
                  GlowButton(
                    headingText: "Book a Coach",
                    buttonText: 'Find Your Best Coach to get trained', // Updated to use buttonText
                    headingTextAlignment: Alignment.centerLeft, // Updated alignment
                    headingTextPadding: EdgeInsets.only(left: 5), // Updated padding
                    buttonTextAlignment: Alignment.centerLeft, // Updated alignment
                    buttonTextPadding: EdgeInsets.only(left: 5), // Updated padding
                    headingTextStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Updated font size for heading
                    ),
                    buttonTextStyle: TextStyle( // New style for button text
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                    gradientColors: [Color.fromRGBO(218, 190, 104, 1), Color.fromRGBO(255, 255, 255, 1)],
                    width: 500,
                    height: 100,
                    borderRadius: 30.0,
                    onPressed: () {
                      print("Book a Coach is Pressed");
                    },
                  ),
                  //Book a Venue btn
                  GlowButton(
                    headingText: "Book a Venue",
                    buttonText: 'Find Your Best Coach to get trained', // Updated to use buttonText
                    headingTextAlignment: Alignment.centerLeft, // Updated alignment
                    headingTextPadding: EdgeInsets.only(left: 5), // Updated padding
                    buttonTextAlignment: Alignment.centerLeft, // Updated alignment
                    buttonTextPadding: EdgeInsets.only(left: 5), // Updated padding
                    headingTextStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Updated font size for heading
                    ),
                    buttonTextStyle: TextStyle( // New style for button text
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                    gradientColors: [Color.fromRGBO(42, 183, 183, 1), Color.fromRGBO(255, 255, 255, 1)],
                    width: 500,
                    height: 100,
                    borderRadius: 30.0,
                    onPressed: () {
                      print("Book a Coach is Pressed");
                    },
                  ),
                ],
              ),
              // Athletic events section 
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Athletic Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // bottomNavigationBar: CurvedNavigationBar(
          //   key: navigationKey,
          //   color: Color.fromRGBO(42, 41, 41, 1),
          //   backgroundColor: Colors.transparent,
          //   animationDuration: Duration(milliseconds: 300),
          //   items: const <Widget>[
          //     Icon(
          //       HugeIcons.strokeRoundedHome02,
          //       size: 30,
          //       color: Color.fromRGBO(255, 49, 49, 1),
          //     ),
          //     Icon(
          //       HugeIcons.strokeRoundedTriangle,
          //       size: 30,
          //       color: Color.fromRGBO(255, 49, 49, 1),
          //     ),
          //     Icon(
          //       HugeIcons.strokeRoundedIceCubes,
          //       size: 30,
          //       color: Color.fromRGBO(255, 49, 49, 1),
          //     ),
          //   ],
          //   onTap: (index) {
          //     //Handle button tap
          //   },
          // ),
          bottomNavigationBar: CustomNavigationBar(
            activeIconColor: Color.fromRGBO(255, 49, 49, 1),
            inactiveIconColor: Color.fromRGBO(255, 255, 255, 1),
            onHomePressed: () {
              
            },
            onEventsPressed: () {
              // Handle events button press
            },
            onVenuesPressed: () {
              // Handle venues button press
            },
            onMessagesPressed: () {
              // Handle messages button press
            },
            onCenterPressed: () {
              // Handle center button press
            },
          ),
        ),
      ),
    );
  }
}
