import 'package:flutter/material.dart';
import 'package:readyplates/src/order/screen/order_option.dart';
import 'package:readyplates/src/Order_Screens/Payment_page.dart';
import 'package:readyplates/utils/my_color.dart';

class ImagewidgetPage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  const ImagewidgetPage({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
  }) : super(key: key);

  // ImagewidgetPage(this.imagePath,required this.height,required   this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
      ),
    );
  }
}

class TextwidgetPage extends StatelessWidget {
  //final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final FontStyle fontstyle;
  final String text;
  final Color color;

  const TextwidgetPage({
    Key? key,
    // required this.fontSize,
    this.fontFamily = 'Inter',
    this.fontstyle = FontStyle.normal,
    required this.fontWeight,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,
          fontSize: 13,
          color: MyTheme.appbartextColor),
    );
  }
}

class ElevatedwidgetPage extends StatelessWidget {
  final double height;
  final double width;
  //final FontWeight fontWeight;
  final String text;
  //final Color ;
  final Color color;
  final Color backgroundColor;

  const ElevatedwidgetPage({
    Key? key,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.text,
    required this.color,
    // this.fontSize = 13,
    // this.fontFamily = 'Inter',
    // required this.fontWeight,
    // required this.text,
    // required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: color, //Color(0xffFF8400),
          ),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, PaymentPage.id);
          },
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontStyle: FontStyle.normal,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedwidgetPage2 extends StatelessWidget {
  final double height;
  final double width;
  //final FontWeight fontWeight;
  final String text;
  //final Color ;
  final Color color;
  final Color backgroundColor;

  const ElevatedwidgetPage2({
    Key? key,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: color, //Color(0xffFF8400),
          ),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, OrderOption.id);
          },
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontStyle: FontStyle.normal,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
