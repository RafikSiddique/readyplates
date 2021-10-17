import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/widgets/buuton.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  Widget buildContainer() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 4,
        width: 4,
        decoration: BoxDecoration(
            color: Color(0xff000000), borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text("Orders",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xff4E535A)),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ACTIVE",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff4E535A)),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFFFFFF),
              ),
              height: 376,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Container(width: 0),
                            Spacer(),
                            Text("Order #210403AS",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff4E535A)),
                                )),
                            Spacer(),
                            buildContainer(),
                            SizedBox(
                              width: 3,
                            ),
                            buildContainer(),
                            SizedBox(
                              width: 3,
                            ),
                            buildContainer(),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 x Sloppy Mac",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            )),
                        Text("\$12.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 x Fries",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            )),
                        Text("\$3.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 31,
                    ),
                    Container(
                      height: 180,
                      width: 180,
                      child: Image(
                        image: AssetImage('assets/images/QRCODE.png'),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Table Reservation",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff222831)),
                            )),
                        Text("10:00 AM",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff222831)),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sloppy Joe, Kondhwa",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff222831)),
                            )),
                        Text("25th Sep",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff222831)),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "PREVIOUS",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff4E535A)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 187,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Container(width: 0),
                            Spacer(),
                            Text("Order #210403AS",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff4E535A)),
                                )),
                            Spacer(),
                            buildContainer(),
                            SizedBox(
                              width: 3,
                            ),
                            buildContainer(),
                            SizedBox(
                              width: 3,
                            ),
                            buildContainer(),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 x Flat white (small) 1 x Whole",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            )),
                        Text("\$12.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Croissant",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            )),
                        Text("\$3.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Elevated(
                      text: " Order Again",
                      width: 272,
                      height: 44,
                    ),
                    SizedBox(height: 0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
    );
  }
}
