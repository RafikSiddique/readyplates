import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrCode extends StatelessWidget {
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
                        color: Color(0xff393E46)),
                  )),
              SizedBox(height: 4),
              Text("Restaurant will guide you to the table ",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff393E46)),
                  )),
              SizedBox(height: 81),
              Center(
                child: Container(
                  height: 276,
                  child: Image(
                    image: AssetImage('assets/images/GreenChek.png'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
