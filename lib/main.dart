//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:readyplates/pages/imagepage.dart';
//import 'package:readyplates/pages/empty.dart';
import 'package:readyplates/src/login/loginpage.dart';
import 'package:readyplates/pages/mappage.dart';
//import 'package:readyplates/pages/mappage.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/login/signuppage.dart';
//import 'package:readyplates/pages/post_serviceapi.dart';
//import 'package:readyplates/pages/signuppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* final Map<String, Widget Function(BuildContext)> routes = {
    "/onbording": (context) => OnbordingPage(),
    "/loginpage": (context) => LoginPage(),
    "/signup": (context) => SignupPage(),
    "/shop": (context) => ShopScreen(),
    "/map": (context) => MapPage(),
    "/image": (context) => ImagePage(),
  }; */

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case '/onbording':
            return OnbordingPage();
          case '/map':
            return MapPage();
          default:
            return OnbordingPage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primaryColor:
          // primarySwatch: Colors.blue,
          ),
      debugShowCheckedModeBanner: false,
      // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

      initialRoute: "/loginpage",

      ///To keep the code clean, Create a map and store the routes there (See the commented map)
      ///and use it as
      ///routes: routes,
      ///If you have alot of pages and which include parameters too,
      ///Then you can use onGenerateRoute method
      ///it goes as (see the method [onGenerateRoute] up in the class)
      ///and use it as
      onGenerateRoute: onGenerateRoute,
      //commect the onGenerateRoute before run else flutter will be confused in routing.
      
      routes: {
        "/onbording": (context) => OnbordingPage(),
        "/loginpage": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/shop": (context) => ShopScreen(),
        "/map": (context) => MapPage(),
        "/image": (context) => ImagePage(),
      },
    );
  }
}
