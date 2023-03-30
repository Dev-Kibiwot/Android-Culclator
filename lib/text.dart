import 'package:flutter/material.dart';
class Custom_Text extends StatelessWidget {

  final String text;
  final double fSize;
  FontWeight ? fWeight;
  double ? lSpacing;
  Color ? textColor;
   Custom_Text({
    super.key, 
    required this.text, 
    required this.fSize, 
    this.fWeight, 
    this.lSpacing,
    this.textColor
    }
   );

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        fontSize: fSize,
        fontWeight: fWeight ?? FontWeight.normal,
        color: textColor ?? Colors.black,
        letterSpacing: lSpacing ?? 1.2,
      ),
    );
  }
}