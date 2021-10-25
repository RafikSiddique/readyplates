import 'package:flutter/material.dart';
import 'package:readyplates/models/restaurant_list.dart';
import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/login/screens/index.dart';
import 'package:readyplates/src/order/screen/index.dart';
import 'package:readyplates/src/static_screens/onbording.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case OnbordingPage.id:
            return OnbordingPage();
          case LoginPage.id:
            return LoginPage();
          case SignupPage.id:
            return SignupPage();
          case ShopScreen.id:
            return ShopScreen();
          case MapPage.id:
            return MapPage(
              isHome: false,
            );
          case ImagePage.id:
            return ImagePage();
          case Aboutlocation.id:
            var args = settings.arguments;
            return Aboutlocation(
              restaurantModel: args as RestaurantModel,
            );
          case Chekoutdone.id:
            return Chekoutdone();
          case OrderPage.id:
            return OrderPage();
          case ShopPage.id:
            return ShopPage();
          case BurgersupportingPage.id:
            return BurgersupportingPage();
          case QrCode.id:
            return QrCode();
          case OrderCancelledPage.id:
            return OrderCancelledPage();
          case PaymentPage.id:
            return PaymentPage();
          case OrderOption.id:
            return OrderOption();
          case Tellafriend.id:
            return Tellafriend();
          case ProfilePage.id:
            return ProfilePage();
          case LandingPage.id:
            return LandingPage();
          case BookingDetails.id:
            return BookingDetails();
          default:
            return OnbordingPage();
        }
      },
    );
  }
}
