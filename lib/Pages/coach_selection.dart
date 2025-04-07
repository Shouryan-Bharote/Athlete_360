import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:athlete_360/Widgets/glow_button.dart'; // Importing GlowButton

class CoachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1), // Dark background
      extendBody: true,

      // ✅ APP BAR
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

      // ✅ BODY
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔎 SEARCH BAR
            Container(
              margin: EdgeInsets.only(top: 13, bottom: 15),
              padding: EdgeInsets.all(12),
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
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // 🏆 CATEGORY TITLE
            Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // 🎯 HORIZONTALLY SCROLLABLE CATEGORY CHIPS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoryChip("Cricket"),
                  categoryChip("Football"),
                  categoryChip("Swimming"),
                  categoryChip("Track"),
                  categoryChip("Tennis"),
                  categoryChip("Badminton"),
                ],
              ),
            ),
            SizedBox(height: 10),

            // 🔥 HORIZONTALLY SCROLLABLE GLOW BUTTONS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GlowButton(
                    headingText: "Book a Coach",
                    text: "Find Your Best Coach",
                    onPressed: () {
                      print("Book a Coach pressed");
                    },
                    gradientColors: [
                      Color.fromRGBO(218, 190, 104, 1),
                      Color.fromRGBO(255, 255, 255, 1),
                    ],
                    width: 220,
                    height: 80,
                    borderRadius: 30.0,
                  ),
                  SizedBox(width: 10),
                  GlowButton(
                    headingText: "Find a Training Center",
                    text: "Locate the best training center",
                    onPressed: () {
                      print("Find a Training Center pressed");
                    },
                    gradientColors: [Colors.orangeAccent, Colors.redAccent],
                    width: 220,
                    height: 80,
                    borderRadius: 30.0,
                  ),
                  SizedBox(width: 10),
                  GlowButton(
                    headingText: "Join a Sports Club",
                    text: "Become part of the community",
                    onPressed: () {
                      print("Join a Sports Club pressed");
                    },
                    gradientColors: [Colors.teal, Colors.greenAccent],
                    width: 220,
                    height: 80,
                    borderRadius: 30.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //coaches
            Text(
              "Top coaches",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            // 🎖 COACH CARDS LIST (NOW SCROLLING VERTICALLY)
            Expanded(
              child: ListView(
                children: [
                  coachCard(
                    "John Doe",
                    "Football",
                    "4.8",
                    "\$50/hr",
                    "assets/images/coach1.jpg",
                  ),
                  coachCard(
                    "Emily Smith",
                    "Tennis",
                    "4.7",
                    "\$45/hr",
                    "assets/images/coach2.jpg",
                  ),
                  coachCard(
                    "Michael Brown",
                    "Swimming",
                    "4.9",
                    "\$55/hr",
                    "assets/images/coach3.jpg",
                  ),
                  coachCard(
                    "Sarah Johnson",
                    "Cricket",
                    "4.6",
                    "\$40/hr",
                    "assets/images/coach4.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ NAVIGATION BAR
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(42, 41, 41, 1),
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(
            HugeIcons.strokeRoundedHome02,
            size: 30,
            color: Color.fromRGBO(255, 49, 49, 1),
          ),
          Icon(
            HugeIcons.strokeRoundedTriangle,
            size: 30,
            color: Color.fromRGBO(255, 49, 49, 1),
          ),
          Icon(
            HugeIcons.strokeRoundedIceCubes,
            size: 30,
            color: Color.fromRGBO(255, 49, 49, 1),
          ),
        ],
        onTap: (index) {},
      ),
    );
  }

  // ✅ CATEGORY CHIP WIDGET
  Widget categoryChip(String title) {
    return Container(
      width: 100, // Slightly wider for better text fit
      height: 45,
      margin: EdgeInsets.only(right: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ✅ COACH CARD WIDGET
  Widget coachCard(
    String name,
    String sport,
    String rating,
    String price,
    String image,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(image), radius: 30),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: Colors.white, fontSize: 16)),
              Text(sport, style: TextStyle(color: Colors.grey)),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(rating, style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  Text(price, style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
