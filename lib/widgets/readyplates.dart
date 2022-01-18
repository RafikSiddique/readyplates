import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

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
                  Assets.logo,
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
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: MyTheme.orangeColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Plates'.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w200,
                            color: MyTheme.orangeColor,
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
