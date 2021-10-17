import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chekoutdone extends StatelessWidget {
  const Chekoutdone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 134,
              ),
              Text("We are waiting for you",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff393E46)),
                  )),
              SizedBox(height: 4),
              Text("Your order #210403AS is complete ",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff393E46)),
                  )),
              SizedBox(height: 81),
              Container(
                height: 276,
                child: Image(
                  image: AssetImage('assets/images/chekoutdone1.png'),
                ),
              ),
            ],
          ),
        ));
  }
}