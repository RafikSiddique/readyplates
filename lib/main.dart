import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/Order_Screens/feedback_page.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      // initialRoute: FeedbackPage.id,
    );
  }
}
