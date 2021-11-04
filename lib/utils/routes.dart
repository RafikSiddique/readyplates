import 'package:flutter/material.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/feedback_page.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/login/screens/index.dart';
import 'package:readyplates/src/order/screen/index.dart';
import 'package:readyplates/src/order/screen/order_option2.dart';
import 'package:readyplates/src/order/screen/payment_sucessful.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/widgets/back_gesture_diable.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => WillNotPopOnGesture(
              child: () {
                switch (settings.name) {
                  case FullImage.id:
                    List<dynamic> args = settings.arguments as List;
                    return FullImage(path: args[0], heroTag: args[1]);
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
                  case RestaurantDetails.id:
                    var args = settings.arguments;
                    return RestaurantDetails(
                      restaurantModel: args as RestaurantModel,
                    );
                  case Chekoutdone.id:
                    return Chekoutdone();
                  case MenuPage.id:
                    final RestaurantModel args =
                        settings.arguments as RestaurantModel;
                    return MenuPage(
                      restaurantModel: args,
                    );
                  case BurgersupportingPage.id:
                    final RestaurantModel args =
                        settings.arguments as RestaurantModel;
                    return BurgersupportingPage(
                      restaurantModel: args,
                    );
                  case QrCode.id:
                    return QrCode();
                  case OrderCancelledPage.id:
                    return OrderCancelledPage();
                  case PaymentPage.id:
                    return PaymentPage();

                  case PaymentsucessfulPage.id:
                    return PaymentsucessfulPage();

                  case FeedbackPage.id: //add feedbackpage
                    return FeedbackPage();
                  case Tellafriend.id:
                    return Tellafriend();
                  case ProfilePage.id:
                    return ProfilePage();
                  case LandingPage.id:
                    return LandingPage();
                  case BookingDetails.id:
                    final RestaurantModel args =
                        settings.arguments as RestaurantModel;
                    return BookingDetails(args);
                  default:
                    return OnbordingPage();
                }
              },
            ));
  }
}
