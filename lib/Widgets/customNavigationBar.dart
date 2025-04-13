import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function()? onHomePressed;
  final Function()? onEventsPressed;
  final Function()? onVenuesPressed;
  final Function()? onMessagesPressed;
  final Function()? onCenterPressed;
  final Color? activeIconColor;
  final Color? inactiveIconColor;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.activeIconColor,
    required this.inactiveIconColor,
    this.onHomePressed,
    this.onEventsPressed,
    this.onVenuesPressed,
    this.onMessagesPressed,
    this.onCenterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 75,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color.fromRGBO(42, 41, 41, 1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  HugeIcons.strokeRoundedHome02,
                  size: 30,
                  color: currentIndex == 0 ? activeIconColor : inactiveIconColor,
                ),
                onPressed: onHomePressed,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  HugeIcons.strokeRoundedBrochure,
                  size: 30,
                  color: currentIndex == 1 ? activeIconColor : inactiveIconColor,
                ),
                onPressed: onEventsPressed,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  HugeIcons.strokeRoundedBuilding03,
                  size: 30,
                  color: currentIndex == 2 ? activeIconColor : inactiveIconColor,
                ),
                onPressed: onVenuesPressed,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  HugeIcons.strokeRoundedMessage02,
                  size: 30,
                  color: currentIndex == 3 ? activeIconColor : inactiveIconColor,
                ),
                onPressed: onMessagesPressed,
              ),
            ],
          ),
        ),
        // The center Cube
        Container(
          margin: EdgeInsets.only(bottom: 45),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == 4 ? activeIconColor : inactiveIconColor,
          ),
          child: IconButton(
            icon: Icon(
              HugeIcons.strokeRoundedRubiksCube,
              size: 30,
              color: currentIndex == 4 ? activeIconColor:  Colors.black ,
            ),
            onPressed: onCenterPressed,
          ),
        )
      ],
    );
  }
}
