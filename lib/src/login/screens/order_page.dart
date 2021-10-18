import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/widgets/buuton.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  Widget buildContainer() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 4,
        width: 4,
        decoration: BoxDecoration(
            color: Color(0xff000000), borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  void showTextMenu({
    required TapDownDetails details,
    required BuildContext context,
  }) {
    final RenderBox overlay = context.findRenderObject() as RenderBox;

    showMenu(
        context: context,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        position: RelativeRect.fromRect(
            details.globalPosition & Size(40, 40), Offset.zero & overlay.size),
        items: [
          PopupMenuItem(
            
            child: Text("data")),
          PopupMenuItem(child: Text("data")),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text("Orders",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xff4E535A)),
            )),
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
                        color: Color(0xff4E535A)),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF),
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
                                        color: Color(0xff4E535A)),
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
                                    color: Color(0xff4E535A)),
                              )),
                          Text("\$12.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xff4E535A)),
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
                                    color: Color(0xff4E535A)),
                              )),
                          Text("\$3.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xff4E535A)),
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
                                    color: Color(0xff222831)),
                              )),
                          Text("10:00 AM",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xff222831)),
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
                                    color: Color(0xff222831)),
                              )),
                          Text("25th Sep",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xff222831)),
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
                      color: Color(0xff4E535A)),
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
                                        color: Color(0xff4E535A)),
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
                                    color: Color(0xff4E535A)),
                              )),
                          Text("\$12.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xff4E535A)),
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
                                    color: Color(0xff4E535A)),
                              )),
                          Text("\$3.00",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xff4E535A)),
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Elevated(
                        text: " Order Again",
                        width: 272,
                        height: 44,
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
