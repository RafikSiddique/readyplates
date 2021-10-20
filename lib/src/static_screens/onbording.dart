import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readyplates/src/login/screens/imagepage.dart';
import 'package:readyplates/src/login/screens/loginpage.dart';
import 'package:readyplates/src/login/screens/signuppage.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/widgets/readyplates.dart';

class OnbordingPage extends StatelessWidget {
  static const id = "/onbording";
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

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Navigator.pushNamed(context, ImagePage.id);
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/readyplates.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 42, right: 42, top: media.viewPadding.top + 5),
                    child: ReadyPlatesText()),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      height: 54,
                      //width: 343,
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
                    /*     SizedBox(
                      height: 54,
                      width: 343,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white.withOpacity(0.2),
                          ),
                          onPressed: () {
                            
                          },
                          child: Text('LOGIN',
                              style: TextStyle(
                                fontSize: 17,
                              ))),
                    ), */
                    //SizedBox(height: 10),
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
                            color: Colors.white.withOpacity(0.5), width: 1.5),
                      ),
                    ),
                    /* SizedBox(
                      height: 54,
                      width: 343,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(34, 40, 49, 0.2),
                            side: BorderSide(
                                width: 1.5,
                                color: Color.fromRGBO(255, 255, 255, 0.5)),
                          ),
                          onPressed: () {
                            
                          },
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                              child: Text('SIGN UP',
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          )),
                    ), */
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              ],
            )));
  }
}
