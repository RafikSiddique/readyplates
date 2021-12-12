import 'package:flutter/cupertino.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/login/screens/ChangePassword2.dart';
import 'package:readyplates/src/login/screens/index.dart';
import 'package:readyplates/src/order/screen/Order_cancel_page.dart';
import 'package:readyplates/src/order/screen/order_option2.dart';
import 'package:readyplates/src/order/screen/payment_sucessful.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/widgets/back_gesture_diable.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return CupertinoPageRoute(
        settings: settings,
        builder: (context) => WillNotPopOnGesture(
              child: () {
                switch (settings.name) {
                  case OnbordingPage.id:
                    return OnbordingPage();
                  case LoginPage.id:
                    return LoginPage();
                  case SignupPage.id:
                    return SignupPage();
                  case ShopScreen.id:
                    return ShopScreen();

                  case ImagePage.id:
                    return ImagePage();
                  // case RestaurantDetails.id:
                  //   var args = settings.arguments;
                  //   return RestaurantDetails(
                  //     restaurantModel: args as RestaurantModel, controller: null,
                  //   );
                  case MenuPage.id:
                    final RestaurantModel args =
                        settings.arguments as RestaurantModel;
                    return MenuPage(
                      restaurantModel: args,
                    );

                  case QrCode.id:
                    return QrCode();
                  case OrderCancelledPage.id:
                    return OrderCancelledPage();

                  case OrderOption2.id:
                    return OrderOption2();

                  case PaymentsucessfulPage.id:
                    return PaymentsucessfulPage();

                  case Tellafriend.id:
                    return Tellafriend();
                  case ChangePasswordPage1.id:
                    return ChangePasswordPage1();
                  case ProfilePage.id:
                    return ProfilePage();
                  case LandingPage.id:
                    return LandingPage();

                  default:
                    return OnbordingPage();
                }
              },
            ));
  }
}
