import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCancelledPage extends StatelessWidget {
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
                color: Color(0xff393E46),
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
                color: Color(0xff393E46),
              ),
            ),
              SizedBox(
              height: 54,
            ),
            Container(
              width: 235.2,
              height: 298.38,
              child: Image(image: AssetImage('assets/images/canceloder.png')),
            ),
          ],
        ),
      ),
    );
  }
}
