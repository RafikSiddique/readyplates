import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/login/screens/loginpage.dart';
import 'package:readyplates/src/login/screens/signuppage.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
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
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.logo,
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'READY',
                            style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 255, 255, 0.9),
                            ),
                            children: [
                              TextSpan(
                                text: ' Plates'.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                  fontSize: 30,
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
                                  Get.toNamed(LoginPage.id);
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  child: Container(
                                    width: size.width,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xffFFFFFF).withOpacity(0.30),
                                    ),
                                    child: Center(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 10,
                                          sigmaY: 10,
                                        ),
                                        child: Text(
                                          'LOGIN',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff222831),
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
                              Get.toNamed(SignupPage.id);
                            },
                            text: "SIGN UP",
                            textColor: Color(0xffFFFFFF),
                            border: Border.all(
                              color: Color(0XffD0D0D0).withOpacity(0.6),
                              width: 1.5,
                            ),
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
    // Get.to(() => BookingDetails(RestaurantModel(
    //     id: 4,
    //     bio: [
    //       Bio(
    //           id: 1,
    //           description: "description",
    //           no_of_tables: "no_of_tables",
    //           max_table_size: "max_table_size",
    //           cost_for_two: "cost_for_two",
    //           servingTime: "servingTime",
    //           recurring_event_date: "recurring_event_date",
    //           recur_freq: "recur_freq",
    //           event_start: "event_start",
    //           event_end: "event_end",
    //           event_desc: "event_desc",
    //           front_fascia_day: "front_fascia_day",
    //           front_fascia_night: "front_fascia_night",
    //           street_view: "street_view",
    //           entrance: "entrance",
    //           ambience1: "ambience1",
    //           ambience2: "ambience2",
    //           ambience3: "ambience3",
    //           ambience4: "ambience4",
    //           food1: "food1",
    //           food2: "food2",
    //           food3: "food3",
    //           food4: "food4",
    //           cv19prec1: "cv19prec1",
    //           cv19prec2: "cv19prec2",
    //           cv19prec3: "cv19prec3",
    //           cv19prec4: "cv19prec4",
    //           completed_till: 4,
    //           user: 0)
    //     ],
    //     resName: "resName",
    //     own_name: "own_name",
    //     own_mobile: "own_mobile",
    //     res_city: "res_city",
    //     poc: "poc",
    //     poc_number: " poc_number",
    //     address: "address",
    //     postal_code: "postal_code",
    //     latitude: "latitude",
    //     longitude: "longitude",
    //     gstin_present: "gstin_present",
    //     gstin_num: "gstin_num",
    //     fssai_status: "fssai_status",
    //     fssai_expiry: "fssai_expiry",
    //     kyc_image: "kyc_image",
    //     gstin_image: "gstin_image",
    //     fssai_image: "fssai_image",
    //     type_of_estd: "type_of_estd",
    //     types_of_cusine: "types_of_cusine",
    //     start_time: "09:00am",
    //     end_time: "10:00p",
    //     open_days: "",
    //     completed_till: 4,
    //     user: 0)));
    try {
      SharedPreferenceHelper sfHelper = SharedPreferenceHelper();
      bool isLoggedIn = await sfHelper.getLoggedIn();
      print(isLoggedIn);
      if (!isLoggedIn) {
        await Future.delayed(Duration(milliseconds: 1000));
        controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        final c = Get.put(HomeController());
        Get.put(OrderController());
        c.getAddress();
        c.getRestaurants();
        Get.offAllNamed(LandingPage.id);
      }
    } catch (e) {
      controller.animateToPage(1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
