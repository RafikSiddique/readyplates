import 'dart:convert';
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
            color: Colors.black,
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
                      onTap: () async {
                        TimeOfDay? tod = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                                hour: controller.selectedDate.value.hour,
                                minute: controller.selectedDate.value.minute));
                        if (tod != null) {
                          controller.selectedDate.value = DateTime(
                              controller.selectedDate.value.year,
                              controller.selectedDate.value.month,
                              controller.selectedDate.value.day,
                              tod.hour,
                              tod.minute);
                        }
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
            numberChange(true, size),
            SizedBox(
              height: 20,
            ),
            numberChange(false, size),
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
