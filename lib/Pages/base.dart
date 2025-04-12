import 'package:athlete_360/Widgets/glow_button_updated.dart';
import 'package:athlete_360/Widgets/customNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:go_router/go_router.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class PlayerBase extends StatefulWidget {
  final String title;
  final Widget child;

  const PlayerBase(
    {super.key,
    required this.title,
    required this.child});

  @override
  State<PlayerBase> createState() => _PlayerBaseState();
}

class _PlayerBaseState extends State<PlayerBase> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  // int _selectedIndex = 0;

  // final List<Widget> _screens = [
  //   HomeScreen(),
  //   EventsScreen(),
  //   VenuesScreen(),
  //   MessagesScreen(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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
      body: widget.child,

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
            onHomePressed: () => context.go('/home'),
            onEventsPressed: () => context.go('/events'), 
            onVenuesPressed: () => context.go('/venues'),
            onMessagesPressed: () => context.go('/messages'),
            onCenterPressed: () {
              // TODO: Implement center button functionality
              print('Center button pressed');
            },
          ),
        ),
      ),
    );
  }
}
