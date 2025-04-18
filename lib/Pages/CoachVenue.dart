import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CoachVenue extends StatefulWidget {
  const CoachVenue({super.key});

  @override
  State<CoachVenue> createState() => _CoachVenueState();
}

class _CoachVenueState extends State<CoachVenue> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      extendBody: true,
    
      // ✅ BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search bar
            Container(
              margin: const EdgeInsets.only(top: 13, bottom: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(42, 41, 41, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Color.fromRGBO(255, 49, 49, 1)),
                  SizedBox(width: 10),
                  Text(
                    'Search for Coach, Venue',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 49, 49, 1),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // 🎯 Book Coach & Venue Cards with navigation
            GestureDetector(
              onTap: () {
                context.push('/CoachScreen');
              },
              child: buildFeatureCard('assets/CoachVenue/book_Coach.png', ''),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookVenuePage()),
                );
              },
              child: buildFeatureCard('assets/CoachVenue/book_Venue.png', ''),
            ),

            const SizedBox(height: 24),

            const Text(
              'Coach-Venue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            buildVenueCard(),
            const SizedBox(height: 80),
          ],
        ),
      ),

    );
  }

  // 🎯 Book a Coach / Book a Venue Card
  Widget buildFeatureCard(String imagePath, String title) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // 🧍‍♂️ Game Max Card
  Widget buildVenueCard() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/CoachVenue/game_max.jpeg'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 12,
            top: 12,
            child: CircleAvatar(
              radius: 28,
            ),
          ),
          Positioned(
            left: 90,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Game Max',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.yellow),
                    SizedBox(width: 4),
                    Text(
                      '4.5 • 4.5k Reviews',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  '5km Away • 10 min',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Icon(Icons.favorite, color: const Color.fromARGB(255, 248, 3, 3), fill: sqrt1_2,),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('Book Venue'),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy destination pages
class BookCoachPage extends StatelessWidget {
  const BookCoachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(child: Text('/caoch_select')),
    );
  }
}

class BookVenuePage extends StatelessWidget {
  const BookVenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(child: Text('Helloooo')),
    );
  }
}
