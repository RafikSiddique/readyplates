import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/imagewidget.dart';
import 'package:share_plus/share_plus.dart';

class Tellafriend extends StatelessWidget {
  static const id = "/tellafriend";
  const Tellafriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.appbackcolor,
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
          backgroundColor: MyTheme.appbackcolor,
          elevation: 0,
          centerTitle: true,
          title: Text('Tell a friend',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 17,
                  color: MyTheme.appbartextColor)),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    ImagewidgetPage(
                      imagePath: "assets/images/option.png",
                      height: 219,
                      width: MediaQuery.of(context).size.width,
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Text("Enjoying Ready Plates?",
                        style: GoogleFonts.nunito(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.borderchangeColor)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "Show us some love. Share the app with your\n     friends and relatives and help us grow",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.bottomtextColor)),
                    SizedBox(
                      height: 36,
                    ),
                    SizedBox(
                      width: 151,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: MyTheme.appbackcolor,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          //Color(0xffEFEFEF),
                          // side: BorderSide(
                          //  width: 1.5, color: Color(0xffB9B9B9)),
                        ),
                        onPressed: () {
                          Share.share(
                              "Hello, ${Get.find<AuthController>().fNamController.text} is inviting you to join");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                child: Image.asset(
                                    "assets/images/ShareNetwork.png",
                                    height: 30,
                                    width: 33,
                                    fit: BoxFit.cover)),
                            SizedBox(
                              width: 6,
                            ),
                            Center(
                              child: Text("SHARE",
                                  style: GoogleFonts.nunito(
                                    fontSize: 19,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    color: MyTheme.appbartextColor,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ImagewidgetPage(
                    //       imagePath: "assets/images/ShareNetwork.png",
                    //       height: 25,
                    //       width: 25,
                    //     ),
                    //     ElevatedwidgetPage(
                    //         height: 50,
                    //         width: 151,
                    //         backgroundColor: Color(0xffE5E5E5),
                    //         text: 'SHARE',
                    //         color: Colors.black)
                    //   ],
                    // )
                  ],
                ),
              ),
            ),

            // SizedBox(
            //   height: 137,
            // ),
            // Text(
            //   "Payment Was successful !",
            //   style: TextStyle(
            //       fontSize: 25,
            //       fontFamily: 'Inter',
            //       fontWeight: FontWeight.w500,
            //       fontStyle: FontStyle.normal,
            //       color: Color(0xff393E46)),
            // ),
            // Text(
            //   "Please provide your valuable feedback !",
            //   style: TextStyle(
            //       fontSize: 15,
            //       fontFamily: 'Inter',
            //       fontWeight: FontWeight.w400,
            //       fontStyle: FontStyle.normal,
            //       color: Color(0xff393E46)),
            // ),
            // SizedBox(
            //   height: 53,
            // ),
          ],
        ),
      ),
    );
  }
}
