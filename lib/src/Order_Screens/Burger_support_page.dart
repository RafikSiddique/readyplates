import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/bottomcontainer.dart';
import 'package:readyplates/widgets/imagewidget.dart';
import 'package:readyplates/widgets/shoppy_mac.dart';

enum Editing { none, confirmed, unconfirmed }

class BurgersupportingPage extends StatefulWidget {
  final RestaurantModel restaurantModel;
  final Editing isEditing;
  final OrderModelApi? orderModelApi;
  BurgersupportingPage({
    Key? key,
    this.orderModelApi,
    required this.restaurantModel,
    required this.isEditing,
  }) : super(
          key: key,
        );

  @override
  State<BurgersupportingPage> createState() => _BurgersupportingPageState();
}

class _BurgersupportingPageState extends State<BurgersupportingPage> {
  final OrderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.now();
    if (widget.isEditing != Editing.none) {
      dt = DateTime(
          int.parse(widget.orderModelApi!.date.split(' ').last),
          (controller
                  .months()
                  .indexOf(widget.orderModelApi!.date.split(' ').first) +
              1),
          int.parse(widget.orderModelApi!.date.split(' ')[1].split(',').first),
          int.parse(widget.orderModelApi!.time.split(":").first),
          int.parse(widget.orderModelApi!.time.split(":").last));

      print(dt);
    }
    return Scaffold(
      backgroundColor: MyTheme.backgroundcolor,
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: MyTheme.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Order Summmary',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: kBottomNavigationBarHeight * 1.2),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(Get.width * 0.025),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: Get.width * 0.02),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.isEditing != Editing.none)
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ...controller.orderEdit
                                  .where((p0) => p0.foodQuantity.value != 0)
                                  .map((element) => ShooppymacPage(
                                        setStae: () {
                                          setState(() {});
                                        },
                                        isEditing: widget.isEditing,
                                        orderEditModel: element,
                                      ))
                            ],
                          )
                        else
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ...controller.cartItems
                                  .map((element) => ShooppymacPage(
                                        setStae: () {
                                          setState(() {});
                                        },
                                        cartModel: element,
                                        isEditing: widget.isEditing,
                                      )),
                            ],
                          ),
                        SizedBox(
                          height: 11,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("TOTAL :",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 13,
                                      color: MyTheme.appbartextColor,
                                    )),
                                Obx(() => Text(
                                      "\$ " +
                                          controller.total.value
                                              .toStringAsFixed(2),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13,
                                        color: MyTheme.appbartextColor,
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sales Tax: ".toUpperCase(),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13,
                                    color: MyTheme.appbartextColor,
                                  )),
                              Text(
                                "\$ 0.5",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: MyTheme.appbartextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                          color: MyTheme.devidercolor,
                        ),
                        Row(
                          children: [
                            ImagewidgetPage(
                              imagePath: Assets.forkKnife,
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                  widget.restaurantModel.resName +
                                      ", " +
                                      (widget.restaurantModel.address),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13,
                                    // color: Color(0xff4E535A)
                                    color: MyTheme.dividermiddletext,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ImagewidgetPage(
                              imagePath: Assets.clock,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            widget.isEditing != Editing.none
                                ? Text(DateFormat(DateFormat.WEEKDAY +
                                            ", " +
                                            DateFormat.DAY +
                                            " " +
                                            DateFormat.MONTH +
                                            " " +
                                            "hh:mm")
                                        .format(dt) +
                                    "\nPAX: ${widget.orderModelApi!.no_of_people}" +
                                    (widget.orderModelApi!.table != null
                                        ? "Tables X ${widget.orderModelApi!.table}"
                                        : ""))
                                : Text(
                                    controller.weekDays[controller
                                                .selectedDate.value.weekday -
                                            1] +
                                        ", " +
                                        controller.selectedDate.value.day
                                            .toString() +
                                        " " +
                                        controller.months()[controller
                                                .selectedDate.value.month -
                                            1] +
                                        " " +
                                        DateFormat("hh:mm a").format(
                                            controller.selectedDate.value) +
                                        "\n" +
                                        "PAX: ${controller.numberOfPeople}",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 13,
                                      color: MyTheme.dividermiddletext,
                                    )),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Bottomcontainer(
              restaurantModel: widget.restaurantModel,
              isEditing: widget.isEditing,
              setState: () {
                controller.calclateTotal(widget.isEditing != Editing.none);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
