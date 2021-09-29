import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 0,
        leading: IconButton(
            iconSize: 30,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Color(0xff000000),
              size: 14.83,
            ),
            onPressed: () {}),
        centerTitle: true,
        title: Text(
          'Nearby Restaurants',
          style: TextStyle(
            fontSize: 17.0,
            color: Color(0xff393E46),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Center(
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
            ),
          ),
        ],
      ),
    );
  }
}
