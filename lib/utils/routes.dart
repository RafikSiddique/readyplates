import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/login/screens/ChangePassword2.dart';
import 'package:readyplates/src/login/screens/forgot_password_page.dart';
import 'package:readyplates/src/login/screens/index.dart';
import 'package:readyplates/src/login/screens/otp_verify_page.dart';
import 'package:readyplates/src/order/screen/Order_cancel_page.dart';
import 'package:readyplates/src/order/screen/order_option2.dart';
import 'package:readyplates/src/order/screen/payment_sucessful.dart';
import 'package:readyplates/src/order/screen/tip_sucessfull_page.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/widgets/back_gesture_diable.dart';

class Routes {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static String getName(Type page) {
    switch (page) {
      case ForgotPasswordPage:
        return ForgotPasswordPage.id;
      case VerifyOtpPage:
        return VerifyOtpPage.id;
      case ShopScreen:
        return ShopScreen.id;
      case QrCode:
        return QrCode.id;
      case OrderCancelledPage:
        return OrderCancelledPage.id;
      case OrderOption2:
        return OrderOption2.id;
      case PaymentsucessfulPage:
        return PaymentsucessfulPage.id;
      case TipsucessfullPage:
        return TipsucessfullPage.id;
      case ChangePasswordPage1:
        return ChangePasswordPage1.id;
      case ProfilePage:
        return ProfilePage.id;
      case MenuPage:
        return MenuPage.id;
      case RestaurantDetails:
        return 'details';
      case LandingPage:
        return "landingpage";
      default:
        return "onboarding";
    }
  }

  static Widget getWidget(String? name) {
    return WillNotPopOnGesture(child: () {
      switch (name) {
        case ForgotPasswordPage.id:
          return ForgotPasswordPage();
        case VerifyOtpPage.id:
          return VerifyOtpPage();
        case ShopScreen.id:
          return ShopScreen(
            isLoggedIn: true,
          );
        case QrCode.id:
          return QrCode();
        case OrderCancelledPage.id:
          return OrderCancelledPage();
        case OrderOption2.id:
          return OrderOption2();

        case PaymentsucessfulPage.id:
          return PaymentsucessfulPage();
        case TipsucessfullPage.id:
          return Tellafriend();
        case ChangePasswordPage1.id:
          return ChangePasswordPage1();
        case ProfilePage.id:
          return ProfilePage();

        default:
          return OnbordingPage();
      }
    });
  }

  static Route<T> pages<T>(RouteSettings settings) {
    return getRoute(getWidget(settings.name), settings: settings);
  }

  static Route<T> getRoute<T>(Widget widget,
      {RouteSettings? settings, String? name}) {
    settings ??= RouteSettings(name: name);
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }

  static Future<T?>? push<T extends Object?>({Widget? page, String? name}) {
    assert(page != null || name != null);
    page ??= getWidget(name);
    return navigatorKey.currentState?.push<T>(getRoute(page, name: name));
  }

  static Future<T?>? pushReplacement<T extends Object?, TO extends Object>(
          Widget page,
          {String? name,
          TO? result}) =>
      navigatorKey.currentState
          ?.pushReplacement<T, TO>(getRoute(page, name: name), result: result);

  static Future<T?>? pushAndRemoveUntil<T extends Object?, TO extends Object>({
    String? name,
    Widget? page,
    bool Function(Route<dynamic>)? predicate,
  }) {
    assert(page != null || name != null);
    page ??= getWidget(name);
    name ??= getName(page.runtimeType);
    predicate = (p0) => false;
    return navigatorKey.currentState
        ?.pushAndRemoveUntil<T>(getRoute(page, name: name), predicate);
  }

  static void pop<T extends Object?>() => navigatorKey.currentState?.pop<T>();
}
