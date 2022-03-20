import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/home/widgets/profile_tile.dart';
import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/src/login/screens/index.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:readyplates/widgets/buuton.dart';
//import 'package:readyplates/widgets/edit_button.dart';

class ProfilePage extends StatelessWidget {
  static const id = "/profile";
  const ProfilePage({Key? key}) : super(key: key);

  Widget button({
    required String text,
    Color? color,
    BoxBorder? border,
    Color textColor = Colors.black,
    required Function() onTap,
  }) {
    double blur = 4;
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
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          appBar: AppBar(
            toolbarHeight: kToolbarHeight,
            backgroundColor: Color(0xffF5F5F5),
            elevation: 0,
            centerTitle: true,
            title: Text('Profile',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 17,
                  letterSpacing: -0.226667,
                  color: MyTheme.appbartextColor,
                )),
          ),
          body: FutureBuilder<String?>(
            future: SharedPreferenceHelper().getUserId(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ProfileListTile(
                        title: "Change Password",
                        onTap: () {
                          Get.to(() => LoginPage(isChangepass: true));
                        }),
                    ProfileListTile(
                      title: "Logout",
                      onTap: () {
                        Get.find<AuthController>().logout();
                        final controller = Get.find<AuthController>();
                        controller.usernameController.clear();
                        controller.passwordController.clear();
                        controller.password2Controller.clear();
                      },
                      isLogout: true,
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 9),
                    child: Column(
                      children: [
                        //Image.asset('assets/images/login.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Login to View Profile",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.textformtextcolor,
                            ),
                          ),
                        ),
                        Elevated(
                            text: "Login",
                            backgroundColor: Color(0xffFF7622).withOpacity(0.6),
                            width: double.infinity,
                            onTap: () {
                              Routes.push(
                                  page: OnbordingPage(
                                nextPage: LandingPage(),
                                until: Routes.getName(LandingPage),
                              ));
                            })
                      ],
                    ),
                  ),
                );
              }
            },
          )),
    );
  }
}
