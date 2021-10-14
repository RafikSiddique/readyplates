import 'package:flutter/material.dart';

class ShooppymacPage extends StatelessWidget {
  const ShooppymacPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/Burger1.png",
            height: 64,
            width: 64,
          ),
          SizedBox(
            width: 10,
          ),
          Text("1 X",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 17,
                  color: Color(0xff222831))),
          SizedBox(
            width: 11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 28,
              // ),
              Text("Sloppy Mac",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xff393E46))),
              SizedBox(
                height: 5,
              ),
              Text("\$ 12.00",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Color(0xff4E535A))),
            ],
          ),
          SizedBox(
            width: 48,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text("-",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Color(0xff393E46))),
                  SizedBox(
                    width: 18,
                  ),
                  Text("1",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff393E46))),
                  SizedBox(
                    width: 16,
                  ),
                  Text("+",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff393E46))),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Image.asset(
                "assets/images/deletbutton.png",
                height: 16,
                width: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}