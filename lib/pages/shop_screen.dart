import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/Order_Screens/about_location.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/utils/my_color.dart';

class ShopScreen extends StatelessWidget {
  static const id = "/shop";
  ShopScreen({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/images/img1.png",
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
  ];
  final List<String> resNames = [
    "The Burger Barn Cafe",
    'Fit Food Co.',
    'Granny’s Soup Shack',
    'Jack’s English Breakfast',
  ];
  final List<String> desc = [
    'American, Fast Food',
    'American, Lebanese, Arabian, Salads ...',
    'Mediterrarian, Indian, Thai, Pan-Asia',
    'English, Breakfast, Pancakes, Ice Creams',
  ];
  final List<String> add = [
    '32, Dataran Sunway | 3.1 kms',
    '21, Kota Damansara | 3.1 kms',
    '32, Dataran Sunway | 3.1 kms',
    '32, Dataran Sunway | 3.1 kms',
  ];
  final List<String> rateTime = [
    '4.3 | Serving Time : 37 mins | \$25 for two',
    '4.3 | Serving Time : 37 mins | \$25 for two',
    '4.3 | Serving Time : 37 mins | \$25 for two',
    '4.3 | Serving Time : 37 mins | \$25 for two',
  ];
  final List<String> offer = [
    '30% off upto \$5',
    '30% off upto \$5',
    '30% off upto \$5',
    '30% off upto \$5',
  ];

  final List<String> category = [
    'Drinks',
    'Burger',
    'Pizza',
    'Seafood',
    'Steak',
    'Burger',
    'Fast Food',
    'Chinese',
  ];
  List<String> categroyImg = [
    'assets/images/drinks.png',
    'assets/images/burger.png',
    'assets/images/pizza.png',
    'assets/images/seafood.png',
    'assets/images/steak.png',
    'assets/images/burger2.png',
    'assets/images/fastfood.png',
    'assets/images/chinese.png',
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MapPage.id);
            }),
        centerTitle: true,
        title: Text(
          'Nearby Restaurants',
          style: TextStyle(
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: MyTheme.hinttextColor,
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
                  child: Row(
                    children: [
                      IconButton(
                          iconSize: 16,
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: MyTheme.appbartextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                //height: MediaQuery.of(context).size.height * 0.2,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  padding: EdgeInsets.zero,
                  children: [
                    for (var i = 0; i < category.length; i++)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              //color: Color(0xffFCEBCD),
                              color: MyTheme.shopboxcolor,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            height: media.size.height * 0.06,
                            width: media.size.height * 0.06,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            child: Image.asset(
                              categroyImg[i],
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.height * 0.035,
                            ),
                          ),
                          Text(category[i])
                        ],
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 17,
                ),
                child: Container(
                  width: 342,
                  height: 14,
                  child: Row(
                    children: [
                      Container(
                        width: 11,
                        height: 11,
                        child: Image.asset('assets/images/location.png'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '32nd Street, Long Beach, San Francisco',
                        style: TextStyle(
                          fontSize: 10,
                          color: MyTheme.appbartextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Near Me'),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    for (var i = 0; i < images.length; i++)
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: media.size.width * 0.04,
                            vertical: media.size.width * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Aboutlocation.id);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(media.size.width * 0.025),
                              child: Row(
                                children: [
                                  Container(
                                    // color: Colors.blue,
                                    width: media.size.height * 0.09,
                                    height: media.size.height * 0.09,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset(images[i]),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        resNames[i],
                                        style: GoogleFonts.montserrat(
                                            fontSize: media.size.height * 0.022,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        desc[i],
                                        style: GoogleFonts.montserrat(
                                          fontSize: media.size.height * 0.013,
                                          color: MyTheme.shoptextcolor2,
                                        ),
                                      ),
                                      Text(
                                        add[i],
                                        style: GoogleFonts.montserrat(
                                          fontSize: media.size.height * 0.013,
                                          color: MyTheme.shoptextcolor2,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: media.size.height * 0.013,
                                            height: media.size.height * 0.013,
                                            child: Image.asset(
                                                'assets/images/star.png'),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            rateTime[i],
                                            style: TextStyle(
                                              fontSize:
                                                  media.size.height * 0.013,
                                              //color: Color(0xff767B91),
                                              color: MyTheme.shoptextcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: (media.size.width -
                                            media.size.height * 0.18),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 3),
                                        child: Divider(
                                          color: MyTheme.devidercolor,
                                          //color: Color(0xffC7CCDB),
                                          thickness: 1,
                                          height: 1,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: media.size.height * 0.013,
                                            height: media.size.height * 0.013,
                                            child: Image.asset(
                                                'assets/images/tag.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            offer[i],
                                            style: TextStyle(
                                              fontSize:
                                                  media.size.height * 0.013,
                                              color: MyTheme.shoptextcolor2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
