import 'package:flutter/material.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/shoppy_mac.dart';

class BurgersupportingPage extends StatelessWidget {
  const BurgersupportingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Color(0xffE5E5E5),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Booking Summmary',
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
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: 390,
                //  color: Color(0xffFFFFFF),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      ShooppymacPage(),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                        color: Color(0xffE4E4E4),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ShooppymacPage(),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        //indent: 18,
                        //endIndent: 18,
                        thickness: 2,
                        color: Color(0xffE4E4E4),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TOTAL :",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                          Text("\$ 24.0",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("EXTRAS :",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                          SizedBox(
                            width: 16,
                          ),
                          Text("Cheese",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                          Spacer(),
                          Text("1 X \$ 0.5",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TAX ",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                          SizedBox(
                            width: 47,
                          ),
                          Text("CGST",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff4E535A))),
                          Spacer(),
                          Text("\$ 0.5",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 78,
                          ),
                          Text("IGST",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff4E535A))),
                          Spacer(),
                          Text("\$ 0.5",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff393E46))),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        //indent: 18,
                        //endIndent: 18,
                        thickness: 2,
                        color: Color(0xffE4E4E4),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/ForkKnife.png",
                            height: 25,
                            width: 25,
                            color: Color(0xff4E535A),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              "Sloppy Joe Burgers, Kondhwa Budruk,Parge,\nNagar,Pune,411048",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff4E535A))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/clock.png",
                            height: 25,
                            width: 25,
                            color: Color(0xff4E535A),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              "Sunday, 25th, September 2021, 10:00 AM \nPAX: 6 Tables X 2",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xff4E535A))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 270,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Color(0xff222831))),
                        Text("\$25.50",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Color(0xff222831))),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Outline(
                        text: 'Add Items',
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        width: 185,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Elevated(
                        text: "Book",
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        width: 185,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
                icon: Image.asset(
                  "assets/images/BottomBar1.png",
                  height: 20,
                  width: 20,
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
                icon: Image.asset(
                  'assets/images/BottomBar2.png',
                  height: 16,
                  width: 16,
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
                icon: Image.asset(
                  'assets/images/BottomBar3.png',
                  height: 16,
                  width: 16,
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
                icon: Image.asset(
                  'assets/images/BottomBar4.png',
                  height: 20,
                  width: 20,
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
                icon: Image.asset(
                  'assets/images/BottomBar5.png',
                  height: 16,
                  width: 16,
                ),
              ),
            ]));
  }
}
