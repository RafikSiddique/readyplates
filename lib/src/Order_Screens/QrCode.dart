import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class QrCode extends StatelessWidget {
  static const id = "/QrCode";
  const QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 181,
              ),
              Text("Verification is Complete",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.appbartextColor),
                  )),
              SizedBox(height: 4),
              Text("Restaurant will guide you to the table ",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.appbartextColor),
                  )),
              SizedBox(height: 81),
              Center(
                child: Container(
                  height: 276,
                  child: Image(
                    image: AssetImage(Assets.greenCheck),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
