import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Elevated extends StatelessWidget {
  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final void Function()? onTap;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets padding;
  final Color? color;
  Elevated({
    Key? key,
    required this.text,
    this.color,
    this.width,
    required this.onTap,
    this.backgroundColor = const Color(0xff222831),
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(vertical: 20.0),
    this.fontSize = 17,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(borderColor),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: borderColor ?? Colors.transparent))),
        ),
        onPressed: onTap,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: fontWeight,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
