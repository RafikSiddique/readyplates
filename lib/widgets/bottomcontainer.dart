import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/Order_Screens/menu_page.dart';
import 'package:readyplates/src/Order_Screens/chekout_done.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

import 'package:readyplates/widgets/imagewidget.dart';

class Bottomcontainer extends StatefulWidget {
  const Bottomcontainer({Key? key}) : super(key: key);

  @override
  State<Bottomcontainer> createState() => _BottomcontainerState();
}

class _BottomcontainerState extends State<Bottomcontainer> {
  final controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //  height: 100,
      // height: MediaQuery.of(context).size.height * 0.10,

      decoration: BoxDecoration(
        color: Colors.white,
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
                      //  color: Color(0xff222831),
                      color: MyTheme.buttonbackgroundColor,
                    )),
                Text("\$25.50",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: MyTheme.buttonbackgroundColor)),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Elevated(
                backgroundColor: Colors.white,
                text: "Add Items",
                borderColor: MyTheme.bottomcontainercolor,
                onTap: () {
                  Get.toNamed(MenuPage.id);
                },
                width: size.width * 0.45,
                padding: EdgeInsets.all(15),
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
              Elevated(
                padding: EdgeInsets.all(15),
                width: size.width * 0.45,
                text: "Book",
                onTap: () {
                  Get.toNamed(
                    Chekoutdone.id,
                  );
                },
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
          SizedBox(
            height: 10,
          )
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
        color: Colors.white,
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
                        color: MyTheme.buttonbackgroundColor)),
                Text("\$25.50",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: MyTheme.buttonbackgroundColor)),
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
                    color: MyTheme.bottomcontainercolor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ElevatedwidgetPage(
                  backgroundColor: Colors.white,
                  text: 'Add from Menu',
                  color: MyTheme.bottomcontainercolor,
                  //color: Color(0xffFF8400),
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
                    color: MyTheme.buttonbackgroundColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ElevatedwidgetPage(
                  backgroundColor: MyTheme.appbartextColor, //Color(0xff393E46),
                  text: 'Confirm',
                  color: Colors.white,
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
