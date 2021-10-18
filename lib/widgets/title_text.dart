import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({Key? key, required this.text}) : super(key: key);

  Widget titleText(String text) {
    return Text(text,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xff374151),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: titleText(text),
    );
  }
}
