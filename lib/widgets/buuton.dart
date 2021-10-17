import 'package:flutter/material.dart';
import 'package:readyplates/utils/routes.dart';

// ignore: must_be_immutable
class Elevated extends StatelessWidget {
  final double fontSize;
  final String text;
  final String fontFamily;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final TextEditingController? secondVal;
  Elevated({
    Key? key,
    this.secondVal,
    required this.text,
    required this.width,
    required this.height,
    this.fontSize = 17,
    this.fontFamily = 'Inter-Bold',
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 54,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff222831))),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.burgersupportingPage);
        },
        child: Text(text),
      ),
    );
  }
}

class Outline extends StatelessWidget {
  final double fontSize;

  final String text;
  final String fontFamily;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final TextEditingController? secondVal;
  Outline({
    Key? key,
    this.secondVal,
    required this.text,
    required this.width,
    required this.height,
    this.fontSize = 10,
    this.fontFamily = 'Inter-Bold',
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: OutlinedButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(color: Color(0xff393E46)),
          )),
    );
  }
}
