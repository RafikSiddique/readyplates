import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class BookingDetails extends GetView<OrderController> {
  final RestaurantModel restaurantModel;
  static const id = "/bookingsettings";

  BookingDetails(this.restaurantModel);
  DateTime now = DateTime.now();

  Text weekText(String text) {
    return Text(text);
  }

  Widget numberChange(bool val, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(val ? "Number of People" : "Number of Table"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Container(
                  width: size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    val
                        ? controller.numberOfPeople.value.toString()
                        : controller.numberOfTable.value.toString(),
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w500,
                        color: MyTheme.dividermiddletext,
                        fontSize: 20),
                  ),
                )),
            Spacer(),
            InkWell(
              onTap: () {
                if (val) {
                  if (controller.numberOfPeople.value != 1) {
                    controller.numberOfPeople--;
                  } else {
                    Get.snackbar("Error", "There should be atleast one person");
                  }
                } else {
                  if (controller.numberOfTable.value != 1) {
                    controller.numberOfTable--;
                  } else {
                    Get.snackbar("Error", "There should be atleast one table");
                  }
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
                  if (val) {
                    controller.numberOfPeople++;
                  } else {
                    controller.numberOfTable++;
                  }
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

  DateTime? time;
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
            color: MyTheme.appbartextColor,
            size: 14.83,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Order",
          style: GoogleFonts.inter(
            color: Colors.black,
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
                        controller.selectedDate.value = await showDatePicker(
                                context: context,
                                initialDate: controller.selectedDate.value,
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime(DateTime.now().year, 12, 31)) ??
                            DateTime.now();
                        print(restaurantModel.open_days.toLowerCase());
                        print(restaurantModel.open_days.contains(controller
                            .weekDays[controller.selectedDate.value.weekday]
                            .toLowerCase()));
                      },
                      child: Row(
                        children: [
                          Text(
                            controller.selectedDate.value.day.toString(),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 40,
                              color: MyTheme.borderchangeColor,
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
                                  print(dateTime.toString());
                                  controller.selectedDate.value = dateTime;
                                },
                                use24hFormat: false,
                                initialDateTime: DateTime(
                                    now.year,
                                    now.month,
                                    now.day,
                                    now.hour,
                                    (now.minute % 5 * 5).toInt()),
                                minuteInterval: 15,
                                mode: CupertinoDatePickerMode.time,
                              ),
                            );
                          },
                        );
                      },
                      // () async {
                      //   TimeOfDay? tod = await showTimePicker(
                      //       context: context,
                      //       initialTime: TimeOfDay(
                      //           hour: controller.selectedDate.value.hour,
                      //           minute: controller.selectedDate.value.minute));
                      //   if (tod != null) {
                      //     print(restaurantModel.start_time);
                      //     print(restaurantModel.end_time);
                      //     List<String> startTimes =
                      //         restaurantModel.start_time.split(':');
                      //     List<String> endTime =
                      //         restaurantModel.end_time.split(':');
                      //     int start = (int.parse(startTimes.first) +
                      //         (startTimes.last.toLowerCase().contains('a')
                      //             ? 0
                      //             : startTimes.last.toLowerCase().contains('p')
                      //                 ? 12
                      //                 : 0));
                      //     int end = int.parse(endTime.first) +
                      //         (endTime.last.toLowerCase().contains('a')
                      //             ? 0
                      //             : endTime.last.toLowerCase().contains('p')
                      //                 ? 12
                      //                 : 0);
                      //     print(start);
                      //     print(end);
                      //     bool isAfterStart = tod.hour > start;
                      //     bool isBeforeEnd = tod.hour < end;
                      //     print(isAfterStart);
                      //     print(isBeforeEnd);
                      //     print(tod);
                      //     if (isAfterStart && isBeforeEnd) {
                      //       controller.selectedDate.value = DateTime(
                      //           controller.selectedDate.value.year,
                      //           controller.selectedDate.value.month,
                      //           controller.selectedDate.value.day,
                      //           tod.hour,
                      //           tod.minute);
                      //     } else {
                      //       Get.snackbar("Error",
                      //           "Restaurant is closed at the selected time");
                      //     }
                      //   }
                      // },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.clock,
                              color: MyTheme.borderchangeColor,
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
                                      .format(controller.selectedDate.value),
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
                fontWeight: FontWeight.w300,
                //color: Color(0xff84888E),
                color: MyTheme.bookingtextcolor,
              ),
            ),
            Text(
              restaurantModel.resName,
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  color: MyTheme.bookingtextcolor,
                  fontSize: 20),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            numberChange(true, size),
            SizedBox(
              height: 17,
            ),
            Text(
              "Available Slots",
              style: GoogleFonts.nunito(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                FontAwesomeIcons.caretUp,
                color: MyTheme.bottomtextColor,
                size: 37,
              ),
            ),
            SizedBox(height: 31),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeButton(
                  fontSize: 15,
                  text: "10:00 AM",
                  fontWeight: FontWeight.w600,
                ),
                TimeButton(
                  fontSize: 15,
                  text: "15:00 AM",
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: MyTheme.timebutton),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.black,
                      ),
                      SizedBox(width: 13),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                            "At the moment there is time slot available for this date. Please try a different date.",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal)),
                      )
                    ],
                  ),
                )),
            SizedBox(height: 10),
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: MyTheme.timebutton),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.black,
                      ),
                      SizedBox(width: 13),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                            "Unfortunately, your party is too large to make a reservation. Please lower the number of people.",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal)),
                      )
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Icon(
                FontAwesomeIcons.caretDown,
                color: MyTheme.bottomtextColor,
                size: 37,
              ),
            ),
            Spacer(),
            Elevated(
              text: "Confirm",
              width: double.infinity,
              onTap: () {
                Get.toNamed(BurgersupportingPage.id,
                    arguments: restaurantModel);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildBottomPicker(Widget picker) {
  return Container(
    height: 250,
    padding: const EdgeInsets.only(top: 6.0),
    color: CupertinoColors.white,
    child: DefaultTextStyle(
      style: const TextStyle(
        fontSize: 22.0,
      ),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
}

class MonthModel {
  String text;
  List<int> days;
  MonthModel({
    required this.text,
    required this.days,
  });

  MonthModel copyWith({
    String? text,
    List<int>? days,
  }) {
    return MonthModel(
      text: text ?? this.text,
      days: days ?? this.days,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'days': days,
    };
  }

  factory MonthModel.fromMap(Map<String, dynamic> map) {
    return MonthModel(
      text: map['text'],
      days: List<int>.from(map['days']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MonthModel.fromJson(String source) =>
      MonthModel.fromMap(json.decode(source));

  @override
  String toString() => 'MonthModel(text: $text, days: $days)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MonthModel &&
        other.text == text &&
        listEquals(other.days, days);
  }

  @override
  int get hashCode => text.hashCode ^ days.hashCode;
}
