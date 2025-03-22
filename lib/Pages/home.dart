import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

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
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(HugeIcons.strokeRoundedLocation05, size: 20, color: Color.fromRGBO(255, 49, 49, 1),),
                        Text('Home', style: TextStyle(color: Color.fromRGBO(255, 49, 49, 1), fontSize: 20),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.notifications, size: 20, color: Color.fromRGBO(255, 49, 49, 1),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            color: Color.fromRGBO(42, 41, 41, 1),
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 300),
            items: const <Widget>[
              Icon(HugeIcons.strokeRoundedHome02, size: 30, color: Color.fromRGBO(255, 49, 49, 1),),
              Icon(HugeIcons.strokeRoundedTriangle, size: 30, color: Color.fromRGBO(255, 49, 49, 1)),
              Icon(HugeIcons.strokeRoundedIceCubes, size: 30, color: Color.fromRGBO(255, 49, 49, 1)),
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
