import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class PaymentsucessfulPage extends StatelessWidget {
  static const id = "/PaymentsucessfulPage";
  const PaymentsucessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Payment was successful !',
              style: GoogleFonts.inter(
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: MyTheme.appbartextColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Please provide you valuable feedback',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                color: MyTheme.appbartextColor,
              ),
            ),
            SizedBox(
              height: 54,
            ),
            Container(
              width: 240.2,
              height: 288.38,
              child: Image(image: AssetImage(Assets.paymentsucess)),
            ),
          ],
        ),
      ),
    );
  }
}
