import 'package:flutter/material.dart';

class GlowButton extends StatelessWidget {
  final String headingText;
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;
  final Alignment textAlignment;
  final TextStyle textStyle;

  const GlowButton({
    Key? key,
    required this.headingText,
    required this.text,
    required this.onPressed,
    this.gradientColors = const [Colors.blue, Colors.green],
    this.width = 200.0,
    this.height = 50.0,
    this.borderRadius = 8.0,
    this.textAlignment = Alignment.center,
    this.textPadding = const EdgeInsets.only(top: 0, left: 8.0), // Added padding
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16.0),
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
          ), backgroundColor: Colors.transparent,
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
            // alignment: textAlignment,
            child: Padding(
              padding: textPadding,
              child: Align(
                alignment: textAlignment,
                child: Text(
                  headingText,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}