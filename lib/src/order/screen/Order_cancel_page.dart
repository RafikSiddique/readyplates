import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class OrderCancelledPage extends StatelessWidget {
  static const id = "/OrderCancelledPage";
  const OrderCancelledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Order Cancelled',
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
              'We wish to serve you soon',
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
              width: 235.2,
              height: 298.38,
              child: Image(image: AssetImage(Assets.canceloder)),
            ),
          ],
        ),
      ),
    );
  }
}
