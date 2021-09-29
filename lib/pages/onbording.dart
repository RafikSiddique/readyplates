import 'package:flutter/material.dart';
import 'package:readyplates/utils/routes.dart';

class OnbordingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/readyplates.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 42, right: 42, top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          child: Image.asset("assets/images/Vector.png")),
                      SizedBox(width: 16),
                      Text(
                        "READY PLATES",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(255, 255, 255, 0.9)),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 54,
                      width: 343,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(255, 255, 255, 0.38),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.LoginPage);
                          },
                          child: Text('LOGIN',
                              style: TextStyle(
                                fontSize: 17,
                              ))),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 54,
                      width: 343,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(34, 40, 49, 0.2),
                            side: BorderSide(
                                width: 1.5,
                                color: Color.fromRGBO(255, 255, 255, 0.5)),
                          ),
                          onPressed: () {
                             Navigator.pushNamed(context, MyRoutes.SignupPage);
                          },
                          child: Text('SIGN UP',
                              style: TextStyle(
                                fontSize: 17,
                              ))),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              ],
            )));
  }
}
