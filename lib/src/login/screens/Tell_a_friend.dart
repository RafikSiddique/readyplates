import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/imagewidget.dart';
import 'package:share_plus/share_plus.dart';

class Tellafriend extends StatelessWidget {
  static const id = "/tellafriend";
  final bool isHome;
  const Tellafriend({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(LandingPage.id);
        return true;
      },
      child: Scaffold(
        backgroundColor: MyTheme.containerColor,
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
          backgroundColor: MyTheme.containerColor,
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
            // SizedBox(
            //   height: 3,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: (MediaQuery.of(context).size.height * 0.85) -
                    kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(188, 202, 224, 0.4),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 144,
                    // ),
                    ImagewidgetPage(
                      imagePath: Assets.option,
                      height: Get.height * 0.25,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                          "Show us some love. Share the app with your friends and relatives and help us grow",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: MyTheme.bottomtextColor)),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    SizedBox(
                      width: 151,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: MyTheme.containerColor,

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
                    SizedBox(
                      height: 25,
                    ),
                    if (!isHome)
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff222831)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side:
                                        BorderSide(color: Colors.transparent))),
                          ),
                          onPressed: () {
                            Get.offAllNamed(LandingPage.id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Icon(Icons.home),
                          )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
