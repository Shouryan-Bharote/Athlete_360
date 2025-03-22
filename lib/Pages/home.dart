import 'package:athlete_360/Widgets/glow_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gradient_coloured_buttons/gradient_coloured_buttons.dart';
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
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Column(
            children: [
              // The location and Profile Image
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedLocation05,
                          size: 20,
                          color: Color.fromRGBO(255, 49, 49, 1),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 49, 49, 1),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          size: 20,
                          color: Color.fromRGBO(255, 49, 49, 1),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/57899051?v=4',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                  GlowButton(
                    text: "Book a Coach",
                    textAlignment: Alignment.center,
                    textStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    gradientColors: [Color.fromRGBO(218, 190, 104, 1), Color.fromRGBO(255, 255, 255, 1)],
                    width: 500,
                    height: 100,
                    borderRadius: 30.0,
                    onPressed: () {
                      print("GradientButton is Pressed");
                    },
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
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
            onTap: (index) {
              //Handle button tap
            },
          ),
        ),
      ),
    );
  }
}
