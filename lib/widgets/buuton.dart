import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/my_color.dart';

class Elevated extends StatelessWidget {
  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets padding;
  final Color? color;
  final bool infoFilled;
  Elevated({
    Key? key,
    required this.text,
    this.color,
    this.width,
    this.height,
    required this.onTap,
    this.infoFilled = false,
    this.backgroundColor = const Color(0xffF47121),
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(vertical: 20.0),
    this.fontSize = 17,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
              fontSize: fontSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomElevated extends StatelessWidget {
  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final void Function()? onTap;
  //final double width;
  //final double height = 28;
  final Color? backgroundColor;
  final Color? borderColor;
  // final EdgeInsets padding;
  final Color? color;
  const CustomElevated({
    Key? key,
    required this.fontSize,
    required this.text,
    required this.fontWeight,
    this.onTap,
    //required this.width,
    this.backgroundColor,
    this.borderColor,
    //required this.padding,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: width,
      height: 28,
      width: 60,
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: MyTheme.borderColor //Color(0xffFF8400),
                ),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: fontWeight,
              color: color,
            ),
          ),
          IconButton(
            icon: Icon(Icons.star_border_outlined),
            iconSize: 10,
            color: MyTheme.borderColor,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}

class TimeButton extends StatelessWidget {
  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final void Function()? onTap;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color borcolor;
  final Color? color;
  const TimeButton(
      {Key? key,
      required this.fontSize,
      required this.text,
      required this.fontWeight,
      this.onTap,
      this.backgroundColor,
      this.borderColor,
      this.color,
      required this.borcolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: width,
        height: 54,

        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 1, color: borcolor),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: fontWeight,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
