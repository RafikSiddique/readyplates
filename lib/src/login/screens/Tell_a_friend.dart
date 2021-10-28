import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/imagewidget.dart';
import 'package:share_plus/share_plus.dart';

class Tellafriend extends StatelessWidget {
  static const id = "/tellafriend";
  const Tellafriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.appbackcolor,
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: MyTheme.appbackcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Tell a friend',
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 17,
              letterSpacing: -0.226667,
              color: MyTheme.appbartextColor
              // color: Color(0xff393E46),
              ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
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
                    height: 219,
                    width: 260,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Enjoying Ready Plates?",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.borderchangeColor
                        // color: Color(0xff00ADB5),
                        ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Show us some love. Share the app with your\n     friends and relatives and help us grow",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.bottomtextColor),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  SizedBox(
                    width: 151,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyTheme.appbackcolor, //Color(0xffEFEFEF),
                        //side: BorderSide(
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
                                  Assets.shareNetwork,
                                  height: 30,
                                  width: 33,
                                  fit: BoxFit.cover)),
                          SizedBox(
                            width: 6,
                          ),
                          Center(
                            child: Text("SHARE",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: 'Nunito',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: MyTheme.appbartextColor,
                                  //color: Color(0xff505056),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),

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
    );
  }
}
