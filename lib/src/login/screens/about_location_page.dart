import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/widgets/buuton.dart';

class Aboutlocation extends StatelessWidget {
  const Aboutlocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return Scaffold(
        body: Stack(
      children: [
        Align(
          child: Container(
            alignment: Alignment.topCenter,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ready.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DraggableScrollableSheet(
              maxChildSize: 1,
              minChildSize: 0.7,
              initialChildSize: 0.7,
              builder:
                  (BuildContext contex, ScrollController scrollcontroller) {
                return SingleChildScrollView(
                  controller: scrollcontroller,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36.0),
                        topRight: Radius.circular(36.0),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                      border: Border.all(
                        color: Color(0xff979797),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(230, 230, 230, 0.547886),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 16, left: 16, top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sloppy Joe Burgers",
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff393E46)),
                                  )),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 13.6,
                                width: 13.6,
                                child: Image(
                                  image: AssetImage('assets/images/clock.png'),
                                ),
                              ),
                              SizedBox(
                                width: 6.7,
                              ),
                              Text(
                                "Open",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xff93BF72)),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text("(Closes at 10:00 Pm)",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff4E535A)),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 14,
                                width: 11,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/pinroundmap.png'),
                                ),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text("Kondhwa Budruk",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff4E535A)),
                                  )),
                              SizedBox(
                                width: 61,
                              ),
                              FaIcon(
                                FontAwesomeIcons.walking,
                                size: 11,
                                color: Color(0xff4E535A),
                              ),
                              Text(
                                "   15 mins",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff4E535A)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "About us",
                            style: GoogleFonts.inter(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Founded in 1954, Burger King is the second largest fast food hamburger chain in the world. The original Home of the Whopper, our commitment to premium ingredients, signature recipes, and family-friendly dining experiences is what has defined our brand for more than 50 successful years",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff4E535A)),
                          ),
                          SizedBox(
                            height: 25.67,
                          ),
                          Row(children: [
                            Container(
                              height: 15.93,
                              width: 15.13,
                              child: Image(
                                image:AssetImage('assets/images/Spoon.png'),
                              ),
                            ),
                            Text(
                              "  20 mins serving time",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff4E535A)),
                            ),
                          ]),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Gallery",
                            style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff222831)),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery1.png')),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery2.png')),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery1.png')),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery2.png')),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(children: [
                            Text(
                              "Events ",
                              style: GoogleFonts.inter(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff222831)),
                            ),
                            Container(
                              height: 13.6,
                              width: 13.6,
                              child: Image(
                                image: AssetImage('assets/images/clock.png'),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "MAY",
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xffF94510)),
                                  ),
                                  Text(
                                    "12",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff393E46)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "All you can eat Buffet",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff393E46)),
                                  ),
                                  Text(
                                    "Starts at 6:00 PM",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff393E46)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 24,
                                      width: 56,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/lessbutton.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "A unique concept of live grill, fabulous buffet menu perfect for large groups. Has this wide variety of smoky dishes and desserts to choose from.",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff71757B)),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xff71757B),
                          ),
                          SizedBox(
                            height: 29,
                          ),
                          Elevated(
                            text: 'Proceed to Menu',
                            width: MediaQuery.of(context).size.width, height: 54,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Outline(
                            text: "Schedule for later",
                            width: MediaQuery.of(context).size.width, height: 54,
                          ),
                          SizedBox(
                            height: 54,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    ));
  }
}
