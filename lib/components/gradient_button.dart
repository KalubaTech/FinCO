import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {

  List<Color>colors;
  String label;
  TextStyle? labelStyle;
  double? height;
  double? width;
  double? borderRadius;
  Function() onclick;


  GradientButton({
    required this.label,
    required this.colors,
    this.labelStyle,
    this.height,
    this.width,
    this.borderRadius,
    required this.onclick
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        width: width??double.infinity,
        height: height??40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius??50),
          gradient: LinearGradient(colors: colors)
        ),
        child: Center(child: Text(label, style: labelStyle??TextStyle(color: Kara.background, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
