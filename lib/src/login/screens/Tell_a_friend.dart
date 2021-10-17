import 'package:flutter/material.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/widgets/imagewidget.dart';

class Tellafriend extends StatelessWidget {
  const Tellafriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          // iconSize: 20.0,
          items: [
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Home',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Color(0xff393E46))),
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.shopRoute);
                },
                child: Container(
                  child: Image.asset(
                    "assets/images/BottomBar1.png",
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Location',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Color(0xff393E46))),
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.MapPage);
                },
                child: Container(
                  child: Image.asset(
                    'assets/images/BottomBar2.png',
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Orders',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Color(0xff00ADB5))),
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.orderOption);
                },
                child: Container(
                  child: Image.asset(
                    'assets/images/BottomBar3.png',
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Tell a Friend',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Color(0xff393E46))),
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.Tellafriend);
                },
                child: Container(
                  child: Image.asset(
                    'assets/images/BottomBar4.png',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Profile',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Color(0xff393E46))),
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.aboutlocation);
                },
                child: Image.asset(
                  'assets/images/BottomBar5.png',
                  height: 16,
                  width: 16,
                ),
              ),
            ),
          ]),
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Tell a friend',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            letterSpacing: -0.226667,
            color: Color(0xff393E46),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 144,
                // ),
                ImagewidgetPage(
                  imagePath: "assets/images/option.png",
                  height: 219,
                  width: 260,
                ),

                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enjoying Ready Plates?",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff00ADB5)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Show us some love. Share the app with your\n     friends and relatives and help us grow",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff6E6D7A)),
                ),
                SizedBox(
                  height: 36,
                ),
                SizedBox(
                  width: 151,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffEFEFEF),
                      //side: BorderSide(
                      //  width: 1.5, color: Color(0xffB9B9B9)),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Image.asset("assets/images/ShareNetwork.png",
                                height: 30, width: 33, fit: BoxFit.cover)),
                        SizedBox(
                          width: 15,
                        ),
                        Text("SHARE",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff505056),
                            )),
                      ],
                    ),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     ImagewidgetPage(
                //       imagePath: "assets/images/ShareNetwork.png",
                //       height: 25,
                //       width: 25,
                //     ),
                //     ElevatedwidgetPage(
                //         height: 50,
                //         width: 151,
                //         backgroundColor: Color(0xffE5E5E5),
                //         text: 'SHARE',
                //         color: Colors.black)
                //   ],
                // )
              ],
            ),
          ),

          // SizedBox(
          //   height: 137,
          // ),
          // Text(
          //   "Payment Was successful !",
          //   style: TextStyle(
          //       fontSize: 25,
          //       fontFamily: 'Inter',
          //       fontWeight: FontWeight.w500,
          //       fontStyle: FontStyle.normal,
          //       color: Color(0xff393E46)),
          // ),
          // Text(
          //   "Please provide your valuable feedback !",
          //   style: TextStyle(
          //       fontSize: 15,
          //       fontFamily: 'Inter',
          //       fontWeight: FontWeight.w400,
          //       fontStyle: FontStyle.normal,
          //       color: Color(0xff393E46)),
          // ),
          // SizedBox(
          //   height: 53,
          // ),
        ],
      ),
    );
  }
}
