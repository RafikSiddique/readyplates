/* import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/my_color.dart';

import 'package:readyplates/widgets/bottomcontainer.dart';

import 'package:readyplates/widgets/imagewidget.dart';

class AddtoorderPage extends StatelessWidget {
  const AddtoorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Order',
            style: GoogleFonts.inter(
              //fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 17,
              letterSpacing: -0.226667,
              color: MyTheme.appbartextColor, //Color(0xff393E46),
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 310,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                      color: MyTheme.devidercolor,
                      // color: Color(0xffE4E4E4),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TOTAL :",
                            style: GoogleFonts.inter(
                              // fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              color: MyTheme.appbartextColor,
                            )),
                        TextwidgetPage(
                          text: "\$ 24.0",
                          color: MyTheme.appbartextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TAX ",
                            style: GoogleFonts.inter(
                              //fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              color: MyTheme.appbartextColor,
                            )),
                        SizedBox(
                          width: 48,
                        ),
                        TextwidgetPage(
                          text: "CGST",
                          color: MyTheme.dividermiddletext,
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        TextwidgetPage(
                          text: "\$ 0.5",
                          color: MyTheme.appbartextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 78,
                        ),
                        TextwidgetPage(
                          text: "IGST",
                          color: MyTheme.dividermiddletext, //Color(0xff4E535A),
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        TextwidgetPage(
                          text: "\$ 0.5",
                          color: MyTheme.appbartextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Bottomcontainer2(),
        ],
      ),
    );
  }
}
 */