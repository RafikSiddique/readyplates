import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class BookingDetails extends GetView<OrderController> {
  late RestaurantModel restaurantModel;
  final Editing isEditing;
  BookingDetails(this.restaurantModel, this.isEditing);
  final DateTime now = DateTime.now();

  Text weekText(String text) {
    return Text(text);
  }

  DateTime tempTime = DateTime.now();

  Widget numberChange(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Number of People",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.normal,
            color: Color(0xff676B71),
            fontSize: 13,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Container(
                  width: size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.numberOfPeople.value.toString(),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: MyTheme.dividermiddletext,
                      fontSize: 20,
                    ),
                  ),
                )),
            Spacer(),
            InkWell(
              onTap: () {
                if (controller.numberOfPeople.value != 1) {
                  controller.numberOfPeople--;
                } else {
                  Get.snackbar("Error", "There should be atleast one person");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.chevronLeft,
                  size: 15,
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  controller.numberOfPeople++;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 15,
                  ),
                )),
          ],
        ),
        Divider()
      ],
    );
  }

  bool checkTime() {
    List<String> startTimes = restaurantModel.start_time.split(':');
    List<String> endTime = restaurantModel.end_time.split(':');
    int start = (int.parse(startTimes.first) +
        (startTimes.last.toLowerCase().contains('a')
            ? 0
            : startTimes.last.toLowerCase().contains('p')
                ? 12
                : 0));
    int end = int.parse(endTime.first) +
        (endTime.last.toLowerCase().contains('a')
            ? 0
            : endTime.last.toLowerCase().contains('p')
                ? 12
                : 0);
    int startMin = int.parse(startTimes.last.split(' ').first);
    int endMin = int.parse(endTime.last.split(' ').first);
    print("$start:$startMin");
    print("$end:$endMin");
    print(tempTime);
    bool isMinuteAfter =
        tempTime.hour == start ? startMin <= tempTime.minute : true;
    if (tempTime.hour == start) {
      print(startMin);
      print(tempTime.minute);
      print(startMin <= tempTime.minute);
    }
    print("Is Minute After Start");
    print(isMinuteAfter);
    bool isMinuteBefore =
        tempTime.hour == end ? endMin >= tempTime.minute : true;
    print("Is Minute Before End");
    print(isMinuteBefore);
    bool isAfterStart = tempTime.hour >= start && isMinuteAfter;
    bool isBeforeEnd = tempTime.hour <= end && isMinuteBefore;
    print("Is After");
    print(isAfterStart);
    print("Is Before");
    print(isBeforeEnd);
    return isAfterStart && isBeforeEnd;
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 330,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 22.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(height: 200, child: picker),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimeButton(
                    borcolor: Colors.transparent,
                    onTap: () {
                      if (checkTime()) {
                        controller.globletime.value = tempTime;
                        var dt = controller.selectedDate.value;
                        controller.selectedDate.value = DateTime(
                            dt.year,
                            dt.month,
                            dt.day,
                            tempTime.hour,
                            tempTime.minute,
                            tempTime.second);
                        Get.back();
                      } else {
                        Get.back();
                        Get.showSnackbar(GetBar(
                          duration: Duration(seconds: 2),
                          message:
                              "The restaurant is unavailable at the selected time\nPlease select time between ${restaurantModel.start_time} and ${restaurantModel.end_time}",
                        ));
                      }
                    },
                    fontSize: 12,
                    text: "Done",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    backgroundColor: MyTheme.orangeColor,
                  ),
                  TimeButton(
                    borcolor: MyTheme.orangeColor,
                    onTap: () {
                      Get.back();
                    },
                    fontSize: 12,
                    text: "Cancel",
                    color: MyTheme.orangeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> proceedToSummary(BuildContext context) async {
    controller.calclateTotal(isEditing != Editing.none);
    print("success");
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => BurgersupportingPage(
              restaurantModel: restaurantModel, isEditing: isEditing),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            FontAwesomeIcons.chevronLeft,
            color: MyTheme.orangeColor,
            size: 14.83,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Order",
          style: GoogleFonts.inter(
            fontStyle: FontStyle.normal,
            color: MyTheme.orangeColor,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Row(
                children: [
                  Card(
                    color: Colors.transparent,
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: InkWell(
                      onTap: () async {
                        DateTime? dt = await showDatePicker(
                          context: context,
                          initialDate: controller.selectedDate.value,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(
                              days: int.parse(
                                  restaurantModel.bio.first.advance_orders))),
                        );
                        //   DateTime(DateTime.now().year, 12, 31)) ??
                        // DateTime.now();

                        print(restaurantModel.open_days);
                        if (restaurantModel.open_days.any((element) =>
                            element.toLowerCase() ==
                            DateFormat(DateFormat.WEEKDAY)
                                .format(dt!)
                                .toLowerCase())) {
                          print("Success");
                          print("Selected Day: " +
                              DateFormat(DateFormat.WEEKDAY).format(dt!));
                          controller.selectedDate.value = DateTime(
                              dt.year,
                              dt.month,
                              dt.day,
                              controller.globletime.value.hour,
                              controller.globletime.value.minute,
                              controller.globletime.value.second);
                        } else {
                          print("Failed");
                          print("Selected Day: " +
                              DateFormat(DateFormat.WEEKDAY).format(dt!));
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            controller.selectedDate.value.day.toString(),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 40,
                              color: MyTheme.orangeColor,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.months()[
                                        controller.selectedDate.value.month -
                                            1] +
                                    " " +
                                    controller.selectedDate.value.year
                                        .toString(),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                controller.weekDays[
                                    controller.selectedDate.value.weekday - 1],
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return _buildBottomPicker(
                              CupertinoDatePicker(
                                onDateTimeChanged: (dateTime) {
                                  tempTime = dateTime;
                                },
                                use24hFormat: false,
                                initialDateTime: DateTime(
                                  controller.globletime.value.year,
                                  controller.globletime.value.month,
                                  controller.globletime.value.day,
                                  controller.globletime.value.hour,
                                  0,
                                ),
                                minuteInterval: 15,
                                mode: CupertinoDatePickerMode.time,
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.clock,
                              color: MyTheme.orangeColor,
                              height: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Text(
                                  DateFormat("hh:mm a")
                                      .format(controller.globletime.value),
                                  style: GoogleFonts.inter(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              endIndent: size.width * 0.02,
              indent: size.width * 0.01,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Venue",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.normal,
                  color: Color(0xff84888E),
                  fontSize: 13),
            ),
            Text(
              restaurantModel.resName,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                color: MyTheme.bookingtextcolor.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            numberChange(size),
            SizedBox(
              height: 17,
            ),
            Spacer(),
            Elevated(
                color: MyTheme.appbackgroundColor,
                text: "Confirm",
                width: double.infinity,
                onTap: () async {
                  DateTime selectedDate = controller.selectedDate.value;
                  DateTime selectedTime = controller.globletime.value;
                  DateTime overallTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                      selectedTime.second);
                  bool isAfterCurrent = overallTime.isAfter(DateTime.now());
                  print(isAfterCurrent);
                  print(overallTime);
                  print(DateTime.now());

                  print("Starting conditions");
                  if (isAfterCurrent) {
                    print("Time validated");
                    if (restaurantModel.open_days.any((element) =>
                            element.toLowerCase() ==
                            DateFormat(DateFormat.WEEKDAY)
                                .format(controller.selectedDate.value)
                                .toLowerCase()) &&
                        checkTime()) {
                      // Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                      //   title: 'Booking',
                      //   message: 'Confirming booking',
                      //   icon: Center(
                      //     child: SizedBox.square(
                      //       dimension: 20,
                      //       child: Center(
                      //         child: CircularProgressIndicator(
                      //           strokeWidth: 2,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ));

                      Get.showSnackbar(GetBar(
                        icon: Center(
                          child: SizedBox.square(
                            dimension: 20,
                            child: Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                            )),
                          ),
                        ),
                        message: "Confirming booking",
                      ));
                      RestaurantModel model = this.restaurantModel;
                      restaurantModel = await Get.find<HomeController>()
                              .getRestaurant(restaurantModel.id) ??
                          model;
                      /*      int ordersCount = await controller.getOrderCount(
                          restaurantModel.id, controller.selectedDate.value); */
                      //  print("Order Count received $ordersCount");

                      /*         bool isAutoOrder = await controller
                          .getAutoOrder(restaurantModel.id.toString()); */
                      // print("auto order availability recieved $isAutoOrder");

                      Get.back();
                      print("Restaurant Open");
                      /*    if (int.parse(restaurantModel.bio.first.no_of_orders) >
                          ordersCount) { */
                      print("Order Limit not exceeded");
                      if (restaurantModel.open_orders) {
                        print("Orders are allowed");
                        await proceedToSummary(context);
                      } else {
                        print("Order Not allowed");
                        //if (isAutoOrder) {
                        print("Auto switching on");
                        /*    DateTime nextDayTime = DateTime(tempTime.year,
                                tempTime.month, tempTime.day + 1, 00, 00, 00); */
                        print(
                            "Check if the selected date is before the tomorrow");
                        /*         if (overallTime.isBefore(nextDayTime)) {
                              print("Selected date is invalid");
                              Get.showSnackbar(GetBar(
                                duration: Duration(milliseconds: 2000),
                                message:
                                    "The restaurant has stopped taking orders for today,\nPlease schedule order for tomorrow or later",
                              ));
                            } else { */
                        Get.showSnackbar(GetBar(
                          duration: Duration(milliseconds: 2000),
                          message:
                              "The restaurant has stopped taking order for now,\nPlease try again later",
                        ));
                        /* print(
                                  "Time validated, placing order for tomorrow or later");
                              await proceedToSummary(context); */
                        //     }
                        /*            } else {
                            Get.showSnackbar(GetBar(
                              duration: Duration(milliseconds: 2000),
                              message:
                                  "The restaurant has stopped taking order for now,\nPlease try again later",
                            ));
                          } */
                      }
                      /*          } else {
                        Get.showSnackbar(GetBar(
                          duration: Duration(milliseconds: 2000),
                          message:
                              "The restaurant has exceeded the order limits for " +
                                  DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                                      .format(overallTime) +
                                  ",\nPlease try any other date",
                        ));
                      } */
                    } else {
                      Get.showSnackbar(GetBar(
                        title: "Closed",
                        message:
                            "The restaurant is closed at selected time\nThe restaurant is open between ${restaurantModel.start_time}-${restaurantModel.end_time}\nOn ${restaurantModel.open_days.join(', ')}",
                        duration: Duration(seconds: 2),
                      ));
                    }
                  } else {
                    Get.showSnackbar(GetBar(
                      title: "Closed",
                      message: "Please select a time after current time",
                      duration: Duration(seconds: 2),
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
