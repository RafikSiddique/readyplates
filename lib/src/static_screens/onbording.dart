import 'dart:io';
import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/src/login/screens/loginpage.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/src/login/screens/signuppage.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/fcm_service.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:readyplates/widgets/readyplates.dart';
import 'package:readyplates/widgets/snackbar.dart';

class OnbordingPage extends StatefulWidget {
  final Widget? nextPage;
  final String? until;
  const OnbordingPage({Key? key, this.nextPage, this.until})
      : assert(nextPage != null ? until != null : true),
        super(key: key);

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

  final controller = PageController();
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var media = MediaQuery.of(context);
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.onboardingBg),
                fit: BoxFit.cover,
              ),
            ),
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: Get.height,
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "rp",
                        child: Material(
                          type: MaterialType.transparency,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                child: Image.asset(
                                  Assets.logo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                // width: size.width * 0.6,
                                height: 40,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'READY',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 30,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          color: MyTheme.orangeColor,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Plates'.toUpperCase(),
                                            style: GoogleFonts.montserrat(
                                              fontSize: 30,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w200,
                                              color: MyTheme.orangeColor,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // BackdropFilter(
                //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Image.asset(
                //         Assets.logo,
                //         width: MediaQuery.of(context).size.width * 0.6,
                //       ),
                //       RichText(
                //         text: TextSpan(
                //             text: 'READY',
                //             style: GoogleFonts.montserrat(
                //               fontSize: 30,
                //               fontStyle: FontStyle.normal,
                //               fontWeight: FontWeight.w700,
                //               color: MyTheme.orangeColor,
                //             ),
                //             children: [
                //               TextSpan(
                //                 text: 'Plates'.toUpperCase(),
                //                 style: GoogleFonts.montserrat(
                //                   fontSize: 30,
                //                   fontStyle: FontStyle.normal,
                //                   fontWeight: FontWeight.w200,
                //                   color: MyTheme.orangeColor,
                //                 ),
                //               ),
                //             ]),
                //       ),
                //     ],
                //   ),
                // ),
                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 42,
                                right: 42,
                                top: media.viewPadding.top),
                            child: Hero(tag: "rp", child: ReadyPlatesText())),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: Hero(
                                tag: "login",
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () {
                                      Routes.push(
                                          page: LoginPage(
                                        nextPage: widget.nextPage,
                                      ));
                                    },
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      child: Container(
                                        width: size.width,
                                        height: 54,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF47121)
                                              .withOpacity(0.15),
                                        ),
                                        child: Center(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 6,
                                              sigmaY: 6,
                                            ),
                                            child: Text(
                                              'LOGIN',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                fontSize: 17,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff2F2E41),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 54,
                              margin: EdgeInsets.only(left: 16, right: 16),
                              width: MediaQuery.of(context).size.width,
                              child: button(
                                onTap: () {
                                  Routes.push(
                                      page: SignupPage(
                                    nextPage: widget.nextPage,
                                  ));
                                },
                                text: "SIGN UP",
                                textColor: Color(0xffFFFFFF),
                                color: Color(0xffFF7622).withOpacity(0.6),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).viewPadding.top),
                        child: TextButton(
                            onPressed: () async {
                              Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                                  message: "Loading..."));
                              if (widget.nextPage == null) {
                                bool getPermission =
                                    await authController.getPermission();
                                if (getPermission) {
                                  if (Platform.isAndroid) {
                                    Position position =
                                        await Geolocator.getCurrentPosition();
                                    Routes.push(
                                        page: MapPage(
                                            isLoggedIn: false,
                                            isHome: false,
                                            latLng: LatLng(position.latitude,
                                                position.longitude)));
                                  } else {
                                    Routes.push(
                                        page: MapPage(
                                            isLoggedIn: false,
                                            isHome: false,
                                            latLng:
                                                authController.hawaiiLatLng));
                                  }
                                } else {
                                  Get.showSnackbar(
                                    MySnackBar.myLoadingSnackBar(
                                        icon: FaIcon(
                                          FontAwesomeIcons.timesCircle,
                                          color: MyTheme.redColor,
                                        ),
                                        message:
                                            "Location permission is required to display restaurants"),
                                  );
                                }
                              } else {
                                Routes.pushAndRemoveUntil(
                                    page: widget.nextPage,
                                    predicate: (route) =>
                                        route.settings.name == widget.until);
                              }
                            },
                            child: Text(
                              "Skip",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    try {
      if (widget.nextPage == null) {
        SharedPreferenceHelper sfHelper = SharedPreferenceHelper();
        bool isLoggedIn = await sfHelper.getLoggedIn();
        print(isLoggedIn);
        if (!isLoggedIn) {
          await Future.delayed(Duration(milliseconds: 1000));
          controller.animateToPage(1,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          FirebaseMessagingService();

          final c = Get.put(HomeController());
          Get.put(OrderController());
          c.getAddress();
          c.getRestaurants();
          Routes.pushAndRemoveUntil(page: LandingPage());
        }
      } else {
        controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    } catch (e) {
      controller.animateToPage(1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
