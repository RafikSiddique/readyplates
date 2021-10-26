import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/order/screen/Orderpage.dart';
import 'package:readyplates/src/Order_Screens/menu_page.dart';
import 'package:readyplates/src/Order_Screens/about_location.dart';
import 'package:readyplates/src/login/screens/Tell_a_friend.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class OrderOption extends StatelessWidget {
  static const id = "/OrderOption";
  const OrderOption({Key? key}) : super(key: key);

  Widget buildContainer() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 4,
        width: 4,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Orders",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: MyTheme.dividermiddletext,
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "ACTIVE",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: MyTheme.dividermiddletext,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 320, //280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
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
                                    color: MyTheme.dividermiddletext,
                                  ),
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
                                color: MyTheme.dividermiddletext,
                              ),
                            )),
                        Text("\$12.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
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
                                color: MyTheme.dividermiddletext,
                              ),
                            )),
                        Text("\$3.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 x Flat white (small) 1 x Whole",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            )),
                        Text("\$12.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            ))
                      ],
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
                                color: MyTheme.dividermiddletext,
                              ),
                            )),
                        Text("\$12.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Elevated(
                      text: "Add to Order ",
                      width: MediaQuery.of(context).size.width,
                      onTap: () {},
                      borderColor:
                          MyTheme.orderoptionbuttoncolor, // Color(0xff222831),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Elevated(
                        text: " Complete Order",
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        onTap: () {},
                        borderColor: MyTheme.orderoptionbuttoncolor,
                        backgroundColor: MyTheme.orderoptionbuttoncolor,
                      ),
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
                  Navigator.pushNamed(context, MenuPage.id);
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
                  Navigator.pushNamed(context, MapPage.id);
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
                  Navigator.pushNamed(context, OrderPage.id);
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
                  Navigator.pushNamed(context, Tellafriend.id);
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
                  Navigator.pushNamed(context, RestaurantDetails.id);
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
