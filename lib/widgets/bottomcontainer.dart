import 'package:flutter/material.dart';
import 'package:readyplates/utils/routes.dart';

import 'package:readyplates/widgets/imagewidget.dart';

class Bottomcontainer extends StatelessWidget {
  const Bottomcontainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 100,
      // height: MediaQuery.of(context).size.height * 0.10,

      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffFF8400),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ElevatedwidgetPage2(
                  backgroundColor: Color(0XFFFFFFF),
                  text: 'Add Items',
                  color: Color(0xffFF8400),
                  // color: Color(0xffFF8400),
                  height: 44,
                  width: 167,
                ),
              ),

              // Outline(
              //   text: 'Add Items',
              //   fontFamily: 'Inter',
              //   fontSize: 15,
              //   fontWeight: FontWeight.bold,
              //   width: 185,
              // ),
              SizedBox(
                width: 9,
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xff222831),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ElevatedwidgetPage(
                  backgroundColor: Color(0xff393E46),
                  text: 'Book',
                  color: Color(0xffFFFFFF),
                  //  styl color: Color(0xffFF8400),
                  height: 44,
                  width: 167,
                ),
              ),

              // Elevated(
              //   text: "Book",
              //   fontFamily: 'Inter',
              //   fontSize: 15,
              //   fontWeight: FontWeight.w700,
              //   width: 185,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bottomcontainer2 extends StatelessWidget {
  const Bottomcontainer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 100,
      // height: MediaQuery.of(context).size.height * 0.10,

      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffFF8400),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ElevatedwidgetPage(
                  backgroundColor: Color(0XFFFFFFF),
                  text: 'Add from Menu',
                  color: Color(0xffFF8400),
                  // color: Color(0xffFF8400),
                  height: 44,
                  width: 167,
                ),
              ),

              // Outline(
              //   text: 'Add Items',
              //   fontFamily: 'Inter',
              //   fontSize: 15,
              //   fontWeight: FontWeight.bold,
              //   width: 185,
              // ),
              SizedBox(
                width: 9,
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xff222831),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ElevatedwidgetPage(
                  backgroundColor: Color(0xff393E46),
                  text: 'Confirm',
                  color: Color(0xffFFFFFF),
                  //  styl color: Color(0xffFF8400),
                  height: 44,
                  width: 167,
                ),
              ),
              // Elevated(
              //   text: "Book",
              //   fontFamily: 'Inter',
              //   fontSize: 15,
              //   fontWeight: FontWeight.w700,
              //   width: 185,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
