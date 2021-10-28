// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
// import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/form_field.dart';

class PaymentPage extends StatelessWidget {
  static const id = "/PaymentPage";
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.appbackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.appbackgroundColor,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: MyTheme.iconColor,
            ),
            onPressed: () {}),
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17, top: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    minimumSize: Size.fromHeight(45),
                    textStyle: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    primary: MyTheme.iconColor,
                    onPrimary: MyTheme.appbackgroundColor,
                    side: BorderSide(
                      width: 1,
                      color: MyTheme.iconColor,
                    )),
                label: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("PayPal"),
                ),
                icon: Container(
                  height: 31,
                  child: Image(image: AssetImage(Assets.paypal)),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  endIndent: 10,
                  thickness: 1,
                  color: MyTheme.devidercolor,
                )),
                Text(
                  "Or pay with card",
                ),
                Expanded(
                    child: Divider(
                  indent: 10,
                  thickness: 1,
                  color: MyTheme.devidercolor,
                )),
              ]),
              SizedBox(
                height: 30,
              ),
              AppFormField(
                toptext: 'Email',
                hintText: 'Example@123',
                controller: TextEditingController(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              SizedBox(
                height: 16,
              ),
              AppFormField(
                toptext: 'Card Information',
                hintText: '1234 1233 1233 1233',
                suffixIcon: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                controller: TextEditingController(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: MyTheme.borderColor,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "MM/YY",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 0,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: MyTheme.borderColor),
                        ),
                      ),
                      Container(
                          width: 180,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "CVV",
                              suffixIcon: Icon(Icons.credit_card),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              AppFormField(
                toptext: "Name On Card",
                hintText: "ABCD",
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                // height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: MyTheme.borderColor,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                ),
                child: DropdownButtonFormField(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      right: 12.21,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.chevronDown,
                      color: MyTheme.iconColor,
                      size: 14.83,
                    ),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Select City',
                    contentPadding: EdgeInsets.only(
                      left: 14,
                      top: 14,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.26,
                      color: MyTheme.hinttextColor,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(child: Text(""), value: ""),
                    DropdownMenuItem(
                        child: Text("Bangladesh"), value: "Bangladesh"),
                    DropdownMenuItem(
                        child: Text("United State"), value: "United State"),
                    DropdownMenuItem(child: Text("India"), value: "India"),
                  ],
                  onChanged: (newValue) {
                    // setState(() {
                    // controller.rescity = newValue.toString();

                    // print(newValue);
                    // },
                    // );
                  },
                ),
              ),
              AppFormField(
                toptext: '',
                hintText: 'ZIP',
                controller: TextEditingController(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              SizedBox(
                height: 56,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  minimumSize: Size.fromHeight(45),
                  textStyle: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                  primary: MyTheme.buttonbackgroundColor,
                  onPrimary: MyTheme.appbackgroundColor,
                  // side: BorderSide(
                  //   width: 1,
                  //   color: MyTheme.iconColor,
                  // )
                ),
                child: Text("Pay \$ 25.50"),
                onPressed: () {
                  Get.offAllNamed(LandingPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
