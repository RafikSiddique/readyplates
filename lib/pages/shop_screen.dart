import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates/utils/routes.dart';

class ShopScreen extends StatelessWidget {
  static const id = "/shop";
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Color(0xff000000),
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.MapPage);
            }),
        centerTitle: true,
        title: Text(
          'Nearby Restaurants',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xff393E46),
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
                  width: 343,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
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
                  child: Row(
                    children: [
                      IconButton(
                          iconSize: 16,
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: Color(0xff000000),
                          ),
                          onPressed: () {}),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff393E46),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
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
                          color: Color(0xff393E46),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 15,
                ),
                child: Container(
                  width: 344,
                  height: 162,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 13.99,
                                      height: 25,
                                      child: Image.asset(
                                          'assets/images/drinks.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  'Drinks',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 22.69,
                                      height: 23,
                                      child: Image.asset(
                                          'assets/images/burger.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                // Image.asset('assets/images/rect.png'),
                                Text(
                                  'Burger',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                          'assets/images/pizza.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                // Image.asset('assets/images/rect.png'),
                                Text(
                                  'Pizza',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                          'assets/images/seafood.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                // Image.asset('assets/images/rect.png'),
                                Text(
                                  'Seafood',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                          'assets/images/steak.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  'Steak',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 24.76,
                                      height: 25,
                                      child: Image.asset(
                                          'assets/images/burger2.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                // Image.asset('assets/images/rect.png'),
                                Text(
                                  'Burger',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 20.02,
                                      height: 20.06,
                                      child: Image.asset(
                                          'assets/images/fastfood.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                // Image.asset('assets/images/rect.png'),
                                Text(
                                  'Fast Food',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCEBCD),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                          'assets/images/chinese.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                // Image.asset('assets/images/rect.png'),
                                Text(
                                  'Chinese',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Near Me'),
              ),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 16),
                child: Container(
                  height: 484,
                  width: 342,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.amber,
                        width: 342,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffFFFFFF),
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    top: 14,
                                  ),
                                  child: Container(
                                    // color: Colors.blue,
                                    width: 84,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        Image.asset('assets/images/img1.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Column(
                                    children: [
                                      Text(
                                        'The Burger Barn Cafe',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'American, Fast Food',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Text(
                                        '32, Dataran Sunway | 3.1 kms',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 7,
                                            height: 7,
                                            child: Image.asset(
                                                'assets/images/star.png'),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '4.3 | Serving Time : 37 mins | \$25 for two',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff767B91),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 193,
                                        height: 0,
                                        child: Divider(
                                          color: Color(0xffC7CCDB),
                                          endIndent: 0,
                                          indent: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 8.33,
                                            height: 8.33,
                                            child: Image.asset(
                                                'assets/images/tag.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '30% off upto \$5',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff919098),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        // color: Colors.red,
                        width: 342,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffFFFFFF),
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    top: 14,
                                  ),
                                  child: Container(
                                    // color: Colors.blue,
                                    width: 84,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        Image.asset('assets/images/img2.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Fit Food Co.',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'American, Lebanese, Arabian, Salads ...',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Text(
                                        '21, Kota Damansara | 3.1 kms',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 7,
                                            height: 7,
                                            child: Image.asset(
                                                'assets/images/star.png'),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '4.3 | Serving Time : 37 mins | \$25 for two',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff767B91),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 193,
                                        height: 0,
                                        child: Divider(
                                          color: Color(0xffC7CCDB),
                                          endIndent: 0,
                                          indent: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 8.33,
                                            height: 8.33,
                                            child: Image.asset(
                                                'assets/images/tag.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '30% off upto \$5',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff919098),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        //color: Colors.green,
                        width: 342,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffFFFFFF),
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    top: 14,
                                  ),
                                  child: Container(
                                    // color: Colors.blue,
                                    width: 84,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        Image.asset('assets/images/img3.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Granny’s Soup Shack',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Mediterrarian, Indian, Thai, Pan-Asia',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Text(
                                        '32, Dataran Sunway | 3.1 kms',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 7,
                                            height: 7,
                                            child: Image.asset(
                                                'assets/images/star.png'),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '4.3 | Serving Time : 37 mins | \$25 for two',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff767B91),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 193,
                                        height: 0,
                                        child: Divider(
                                          color: Color(0xffC7CCDB),
                                          endIndent: 0,
                                          indent: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 8.33,
                                            height: 8.33,
                                            child: Image.asset(
                                                'assets/images/tag.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '30% off upto \$5',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff919098),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        // color: Colors.blue,
                        width: 342,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffFFFFFF),
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    top: 14,
                                  ),
                                  child: Container(
                                    //  color: Colors.blue,
                                    width: 84,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        Image.asset('assets/images/img4.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Jack’s English Breakfast',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'English, Breakfast, Pancakes, Ice Creams',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Text(
                                        '32, Dataran Sunway | 3.1 kms',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff919098),
                                        ),
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 7,
                                            height: 7,
                                            child: Image.asset(
                                                'assets/images/star.png'),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '4.3 | Serving Time : 37 mins | \$25 for two',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff767B91),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 193,
                                        height: 0,
                                        child: Divider(
                                          color: Color(0xffC7CCDB),
                                          endIndent: 0,
                                          indent: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            width: 8.33,
                                            height: 8.33,
                                            child: Image.asset(
                                                'assets/images/tag.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '30% off upto \$5',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(0xff919098),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
