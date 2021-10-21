import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/Order_Screens/Payment_page.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class Chekoutdone extends StatelessWidget {
  static const id = "/chekoutdone";
  const Chekoutdone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(LandingPage.id);
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("We are waiting for you",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        //color: Color(0xff393E46),
                        color: MyTheme.appbartextColor,
                      ),
                    )),
                SizedBox(height: 4),
                Text("Your order #210403AS is complete ",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.appbartextColor,
                      ),
                    )),
                SizedBox(height: 81),
                Container(
                  height: 276,
                  child: Image(
                    image: AssetImage('assets/images/chekoutdone1.png'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Elevated(
                  width: MediaQuery.of(context).size.width / 2.5,
                  text: "Pay Now",
                  onTap: () {
                    Get.toNamed(PaymentPage.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Elevated(
                  width: MediaQuery.of(context).size.width / 2.5,
                  text: "Pay Later",
                  onTap: () {
                    Get.offAllNamed(LandingPage.id);
                  },
                )
              ],
            ),
          )),
    );
  }
}
