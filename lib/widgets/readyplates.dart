import 'package:flutter/material.dart';
import 'package:readyplates/utils/assets.dart';

class ReadyPlatesText extends StatelessWidget {
  const ReadyPlatesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.only(top: 34),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: 40,
                height: 35,
                child: Image.asset(
                  Assets.spoon,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Container(
                // width: size.width * 0.6,
                height: 39,
                child: RichText(
                  text: TextSpan(
                      text: 'READY',
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: -0.0769231,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                      ),
                      children: [
                        TextSpan(
                          text: ' Plates'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Montserrat',
                            letterSpacing: -0.0769231,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
