import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/src/order/screen/booking_details.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/fcm_service.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessagingService();
  Get.put(SharedPreferenceHelper());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        popupMenuTheme: PopupMenuThemeData(
          enableFeedback: true,
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
        dividerColor: MyTheme.orderbordercolor,
      ),
      debugShowCheckedModeBanner: false,
      home: OnbordingPage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
