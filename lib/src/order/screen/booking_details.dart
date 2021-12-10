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
  final bool isEditing;
  BookingDetails(this.restaurantModel, this.isEditing);
  DateTime now = DateTime.now();

  Text weekText(String text) {
    return Text(text);
  }

  Widget numberChange(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Number of People"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Container(
                  width: size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.numberOfPeople.value.toString(),
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w500,
                        color: MyTheme.dividermiddletext,
                        fontSize: 20),
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
                    borcolor: Colors.white,
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
                      } else {
                        print("Failed");
                        print(tempTime);
                      }
                      Get.back();
                    },
                    fontSize: 12,
                    text: "Done",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    backgroundColor: Colors.black,
                  ),
                  TimeButton(
                    borcolor: Colors.black,
                    onTap: () {
                      Get.back();
                    },
                    fontSize: 12,
                    text: "Cancel",
                    color: Colors.black,
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

  DateTime tempTime = DateTime.now();

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
                        DateTime dt = await showDatePicker(
                                context: context,
                                initialDate: controller.selectedDate.value,
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime(DateTime.now().year, 12, 31)) ??
                            DateTime.now();

                        print(restaurantModel.open_days);
                        if (restaurantModel.open_days.any((element) =>
                            element.toLowerCase() ==
                            DateFormat(DateFormat.WEEKDAY)
                                .format(dt)
                                .toLowerCase())) {
                          print("Success");
                          print("Selected Day: " +
                              DateFormat(DateFormat.WEEKDAY).format(dt));
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
                              DateFormat(DateFormat.WEEKDAY).format(dt));
                        }
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
            numberChange(size),
            SizedBox(
              height: 17,
            ),
            /*       Text(
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
                  borcolor: MyTheme.borderColor,
                  fontSize: 15,
                  text: "10:00 AM",
                  fontWeight: FontWeight.w600,
                ),
                TimeButton(
                  borcolor: MyTheme.borderColor,
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
            ), */
            Spacer(),
            Elevated(
              text: "Confirm",
              width: double.infinity,
              onTap: () {
                if (restaurantModel.open_days.any((element) =>
                        element.toLowerCase() ==
                        DateFormat(DateFormat.WEEKDAY)
                            .format(controller.selectedDate.value)
                            .toLowerCase()) &&
                    checkTime()) {
                  print("success");
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => BurgersupportingPage(
                            restaurantModel: restaurantModel,
                            isEditing: isEditing),
                      ));
                } else {
                  Get.showSnackbar(GetBar(
                    title: "Closed",
                    message:
                        "The restaurant is closed at selected time\nThe restaurant is open between ${restaurantModel.start_time}-${restaurantModel.end_time}\nOn ${restaurantModel.open_days.join(', ')}",
                    duration: Duration(seconds: 2),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
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
