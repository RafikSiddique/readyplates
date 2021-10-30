import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class ShooppymacPage extends StatelessWidget {
  final CartModel cartModel;
  const ShooppymacPage({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            Assets.categoryBurger2,
            height: 64,
            width: 64,
          ),
          Spacer(),
          /* SizedBox(
            width: 10,
          ), */
          /*         Text("1 X",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 17,
                  color: Color(0xff222831))),
          SizedBox(
            width: 11,
          ), */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 28,
              // ),
              Text("Sloppy Mac",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: MyTheme.appbartextColor,
                  )),
              SizedBox(
                height: 5,
              ),
              Text("\$ 12.00",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Color(0xff4E535A))),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text("-",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: MyTheme.appbartextColor,
                      )),
                  SizedBox(
                    width: 18,
                  ),
                  Text("1",
                      style: GoogleFonts.inter(
                        //fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: MyTheme.appbartextColor,
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  Text("+",
                      style: GoogleFonts.inter(
                        //fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: MyTheme.appbartextColor,
                      )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Image.asset(
                Assets.delete,
                height: 16,
                width: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
