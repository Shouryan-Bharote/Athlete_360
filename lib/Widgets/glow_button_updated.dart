import 'package:flutter/material.dart';

class GlowButton extends StatelessWidget {
  final String headingText;
  final String buttonText; // New property for button text
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry
  headingTextPadding; // New property for heading text padding
  final Alignment
  headingTextAlignment; // New property for heading text alignment
  final EdgeInsetsGeometry
  buttonTextPadding; // New property for button text padding
  final Alignment buttonTextAlignment; // New property for button text alignment
  final TextStyle headingTextStyle; // New property for heading text style
  final TextStyle buttonTextStyle; // New property for button text style

  const GlowButton({
    Key? key,
    required this.headingText,
    required this.buttonText, // Updated constructor
    required this.onPressed,
    this.gradientColors = const [Colors.blue, Colors.green],
    this.width = 200.0,
    this.height = 50.0,
    this.borderRadius = 8.0,
    this.headingTextAlignment = Alignment.center, // Default alignment
    this.headingTextPadding = const EdgeInsets.only(
      top: 0,
      left: 8.0,
    ), // Default padding
    this.buttonTextAlignment = Alignment.center, // Default alignment
    this.buttonTextPadding = const EdgeInsets.only(
      top: 0,
      left: 8.0,
    ), // Default padding
    this.headingTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
    ), // Default style
    this.buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ), // Default style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.all(5),
          elevation: 0,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Container(
            width: width,
            height: height,
            child: Column(
              // Use Column to stack texts
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: headingTextPadding,
                  child: Align(
                    alignment: headingTextAlignment,
                    child: Text(headingText, style: headingTextStyle),
                  ),
                ),
                Padding(
                  padding: buttonTextPadding,
                  child: Align(
                    alignment: buttonTextAlignment,
                    child: Text(buttonText, style: buttonTextStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
