import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
// import 'package:readyplates/src/login/screens/imagepage.dart';
import 'package:readyplates/src/login/screens/loginpage.dart';
import 'package:readyplates/src/login/screens/signuppage.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:readyplates/widgets/readyplates.dart';

class OnbordingPage extends StatefulWidget {
  static const id = "/onbording";

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> with AfterLayoutMixin {
  Widget button({
    required String text,
    Color? color,
    BoxBorder? border,
    Color textColor = Colors.black,
    required Function() onTap,
  }) {
    double blur = 8;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            border: border,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur,
                sigmaY: blur,
              ),
              child: Container(
                decoration: BoxDecoration(),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 17,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/readyplates.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/spoon.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'READY',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: -0.0769231,
                              fontFamily: 'Montserrat',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 255, 255, 0.9),
                            ),
                            children: [
                              TextSpan(
                                text: ' Plates'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Montserrat',
                                  letterSpacing: -0.0769231,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(255, 255, 255, 0.9),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: 42, right: 42, top: media.viewPadding.top),
                        child: Hero(tag: "rp", child: ReadyPlatesText())),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          height: 54,
                          width: MediaQuery.of(context).size.width,
                          child: button(
                              onTap: () {
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                              text: "LOGIN",
                              color: Colors.white.withOpacity(0.35)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 54,
                          //  width: 343,
                          margin: EdgeInsets.only(left: 16, right: 16),
                          width: MediaQuery.of(context).size.width,
                          child: button(
                            onTap: () {
                              Navigator.pushNamed(context, SignupPage.id);
                            },
                            text: "SIGN UP",
                            textColor: Colors.white,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5),
                                width: 1.5),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )));
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    try {
      SharedPreferenceHelper sfHelper = SharedPreferenceHelper();
      bool isLoggedIn = await sfHelper.getLoggedIn();
      if (!isLoggedIn) {
        await Future.delayed(Duration(milliseconds: 1000));
        controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        Get.put(HomeController());
        Get.put(OrderController());
        Get.offAllNamed(LandingPage.id);
      }
    } catch (e) {
      controller.animateToPage(1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
