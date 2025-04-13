import 'package:flutter/material.dart';
import 'package:athlete_360/widgets/glow_button_updated.dart'; // Your custom button

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The Search Bar
        Container(
          
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
            // Book a Coach button
            GlowButton(
              headingText: "Book a Coach",
              buttonText: 'Find Your Best Coach to get trained',
              headingTextAlignment: Alignment.centerLeft,
              headingTextPadding: EdgeInsets.only(left: 5),
              buttonTextAlignment: Alignment.centerLeft,
              buttonTextPadding: EdgeInsets.only(left: 5),
              headingTextStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              buttonTextStyle: TextStyle(
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
            // Book a Venue button
            GlowButton(
              headingText: "Book a Venue",
              buttonText: 'Find Your Best Coach to get trained',
              headingTextAlignment: Alignment.centerLeft,
              headingTextPadding: EdgeInsets.only(left: 5),
              buttonTextAlignment: Alignment.centerLeft,
              buttonTextPadding: EdgeInsets.only(left: 5),
              headingTextStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              buttonTextStyle: TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
              gradientColors: [Color.fromRGBO(42, 183, 183, 1), Color.fromRGBO(255, 255, 255, 1)],
              width: 500,
              height: 100,
              borderRadius: 30.0,
              onPressed: () {
                print("Book a Venue is Pressed");
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
    );
  }
}
