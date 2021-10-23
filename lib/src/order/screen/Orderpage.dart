import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/order/screen/Order_cancel_page.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/imagewidget.dart';

class PopUpMenuWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String path;
  final Color color;
  const PopUpMenuWidget(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.path,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      /* () {
                
              }, */
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ImagewidgetPage(
          imagePath: path, // '',
          width: 15,
          height: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text, //"Edit Order",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: color, // ,
              fontSize: 12),
        )
      ]),
    );
  }
}

class OrderPage extends StatelessWidget {
  static const id = "/orderPage";
  const OrderPage({Key? key}) : super(key: key);

  void showTextMenu({
    required TapDownDetails details,
    required BuildContext context,
  }) {
    final RenderBox overlay = context.findRenderObject() as RenderBox;

    showMenu(
        context: context,
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.zero,
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          side: BorderSide(
            color: MyTheme.orderbordercolor,
            //color: Color(0xffBBBBB6),
          ),
        ),
        useRootNavigator: false,
        color: Colors.white,
        position: RelativeRect.fromRect(
            details.globalPosition & Size(40, 40), Offset.zero & overlay.size),
        items: <PopupMenuEntry>[
          PopupMenuItem(
              height: 20,
              onTap: null,
              child: PopUpMenuWidget(
                onTap: () {
                  Get.to(() => BurgersupportingPage());
                },
                text: "Edit Order",
                path: 'assets/images/NotePencil.png',
                color: MyTheme.orderpopupcolor,
              )),
          PopupMenuDivider(
            height: 12,
          ),
          PopupMenuItem(
              height: 20,
              padding: EdgeInsets.zero,
              onTap: null,
              child: PopUpMenuWidget(
                onTap: () {
                  Get.to(() => OrderCancelledPage());
                },
                path: 'assets/images/CheckCircle.png',
                text: "Cancel Order",
                color: MyTheme.orderpopupcolor,
                //color: Color(0xffF88020),
              )

              // Text("data")
              ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Orders",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: MyTheme.dividermiddletext),
          ),
        ),
        leading: Container(),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ACTIVE",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.dividermiddletext),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 376,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 10),
                              Text("Order #210403AS",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.dividermiddletext),
                                  )),
                              GestureDetector(
                                  onTapDown: (details) {
                                    showTextMenu(
                                        details: details, context: context);
                                  },
                                  child: Icon(Icons.more_horiz)),
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
                                    color: MyTheme.dividermiddletext),
                              )),
                          Text("\$12.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext),
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
                                    color: MyTheme.dividermiddletext),
                              )),
                          Text("\$3.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext),
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
                                    // color: Color(0xff222831),
                                    color: MyTheme.buttonbackgroundColor),
                              )),
                          Text("10:00 AM",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor),
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
                                    color: MyTheme.buttonbackgroundColor),
                              )),
                          Text("25th Sep",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor),
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
                      color: MyTheme.dividermiddletext),
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
                                        color: MyTheme.dividermiddletext),
                                  )),
                              Spacer(),
                              Icon(Icons.more_horiz)
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
                                    color: MyTheme.dividermiddletext),
                              )),
                          Text("\$12.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext),
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
                                    color: MyTheme.dividermiddletext),
                              )),
                          Text("\$3.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext),
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Elevated(
                        text: " Order Again",
                        width: 272,
                        onTap: () {},
                      ),
                      SizedBox(height: 0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
