import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/routes.dart';

class MySnackBar {
  static GetBar myLoadingSnackBar({
    String title = '',
    required String message,
    int duration = 3,
    SnackPosition snackPosition = SnackPosition.TOP,
    Widget? icon,
  }) {
    return GetBar(
      titleText: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          title,
          style: GoogleFonts.nunito(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      messageText: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          message,
          style: GoogleFonts.nunito(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      duration: Duration(seconds: duration),
      snackPosition: snackPosition,
      backgroundColor: MyTheme.verifyButtonColor,
      icon: Padding(padding: EdgeInsets.only(left: 12), child: icon),
    );
  }

  static GetBar loginSnackBar({
    String title = 'Error',
    int duration = 3,
    SnackPosition snackPosition = SnackPosition.TOP,
    Widget? nextPage,
    String? until,
  }) {
    return GetBar(
      titleText: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          title,
          style: GoogleFonts.nunito(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      messageText: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          'Please login to continue',
          style: GoogleFonts.nunito(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      mainButton: TextButton(
          onPressed: () {
            Routes.push(
              page: OnbordingPage(
                nextPage: nextPage,
                until: until,
              ),
            );
          },
          child: Text('Login')),
      duration: Duration(seconds: duration),
      snackPosition: snackPosition,
      backgroundColor: MyTheme.verifyButtonColor,
      icon: Padding(
        padding: EdgeInsets.only(left: 12),
        child: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ),
    );
  }
}
/*

loading snack bar
 Get.showSnackbar(
                                              MySnackBar.myLoadingSnackBar(
                                            color: MyTheme.verifyButtonColor,
                                            title: 'Booking',
                                            message: "Confirming booking",
                                            icon: Center(
                                              child: SizedBox.square(
                                                dimension: 20,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: MyTheme.orangeColor,
                                                )),
                                              ),
                                            ),
                                          ));
                      //////////

success
  Get.showSnackbar(
                                              MySnackBar.myLoadingSnackBar(
                                           color: MyTheme.verifyButtonColor,
                                            title: 'Location',
                                            message: 'Location updated',
                                            icon: Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: MyTheme.greenColor,
                                            ),
                                          ));
                                          /////
info
Get.showSnackbar(
                                              MySnackBar.myLoadingSnackBar(
                                            color: MyTheme.verifyButtonColor,
                                            title: 'Orders',
                                            message:
                                                "The restaurant has stopped taking order for now,\nPlease try again later",
                                            icon: Icon(
                                              Icons.error_outline_rounded,
                                              color: MyTheme.blueColor,
                                            ),
                                          ));
                        ////////////
warning 
Get.showSnackbar(
                                              MySnackBar.myLoadingSnackBar(
                                            color: MyTheme.verifyButtonColor,
                                            title: 'Warning',
                                            message:
                                                'You cannot decrease any item once the order is confirmed',
                                            icon: Icon(
                                              Icons.warning_amber_rounded,
                                              color: MyTheme.orangelightColor,
                                            ),
                                          ));
                                          /////
 Error                                         
                                          
                                         Get.showSnackbar(
                                              MySnackBar.myLoadingSnackBar(
                                            color: MyTheme.verifyButtonColor,
                                            title: 'Warning',
                                            message:
                                                'You cannot decrease any item once the order is confirmed',
                                            icon: FaIcon(
                                              FontAwesomeIcons.timesCircle,
                                              color: MyTheme.redColor,
                                            ),
                                          ));

*/