import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/order/screen/Orderpage.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class BookingDetails extends StatefulWidget {
  static const id = "/bookingsettings";
  BookingDetails({Key? key}) : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  void initState() {
    super.initState();
  }

  Text weekText(String text) {
    return Text(text);
  }

  List<int> days(int length) => List.generate(length, (index) => index + 1);
  List<MonthModel> months() => [
        MonthModel(text: "January", days: days(31)),
        MonthModel(
          text: "February",
          days: days(DateTime.now().year % 4 == 0 ? 29 : 28),
        ),
        MonthModel(text: "March", days: days(31)),
        MonthModel(text: "April", days: days(30)),
        MonthModel(text: "May", days: days(31)),
        MonthModel(text: "June", days: days(30)),
        MonthModel(text: "July", days: days(31)),
        MonthModel(text: "August", days: days(31)),
        MonthModel(text: "September", days: days(30)),
        MonthModel(text: "October", days: days(31)),
        MonthModel(text: "November", days: days(30)),
        MonthModel(text: "December", days: days(31)),
      ];

  DateTime selectedDate = DateTime.now();

  List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednessday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  int numberOfPeople = 1;
  int numberOfTable = 1;

  Widget numberChange(bool val, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(val ? "Number of People" : "Number of Table"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.3,
              alignment: Alignment.centerLeft,
              child: Text(
                val ? numberOfPeople.toString() : numberOfTable.toString(),
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w500,
                    color: MyTheme.dividermiddletext,
                    fontSize: 20),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                if (val) {
                  if (numberOfPeople != 1) {
                    numberOfPeople--;
                  } else {
                    Get.snackbar("Error", "There should be atleast one person");
                  }
                } else {
                  if (numberOfTable != 1) {
                    numberOfTable--;
                  } else {
                    Get.snackbar("Error", "There should be atleast one table");
                  }
                }
                setState(() {});
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
                    numberOfPeople++;
                  } else {
                    numberOfTable++;
                  }

                  setState(() {});
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
            Row(
              children: [
                Card(
                  color: Colors.transparent,
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  child: InkWell(
                    onTap: () async {
                      selectedDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime(DateTime.now().year, 12, 31)) ??
                          DateTime.now();
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Text(
                          selectedDate.day.toString(),
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
                              months()[selectedDate.month - 1].text +
                                  " " +
                                  selectedDate.year.toString(),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              weekDays[selectedDate.weekday - 1],
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
                              hour: selectedDate.hour,
                              minute: selectedDate.minute));
                      if (tod != null) {
                        selectedDate = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            tod.hour,
                            tod.minute);
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/clock.png',
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
                                DateFormat("hh:mm a").format(selectedDate),
                                style: GoogleFonts.inter(fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
              "Sloppy Joe Burgers",
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
                Get.toNamed(BurgersupportingPage.id);
              },
            ),
            /*    Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (currentIndex == 0) {
                            currentIndex = months().length - 1;
                          } else {
                            currentIndex--;
                          }
                          setState(() {});
                        },
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          size: 15,
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        alignment: Alignment.center,
                        child: Text(
                          months()[currentIndex].text,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            if (currentIndex == 11) {
                              currentIndex = 0;
                            } else {
                              currentIndex++;
                            }
                            setState(() {});
                          },
                          child: Icon(
                            FontAwesomeIcons.chevronRight,
                            size: 15,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      weekText("S"),
                      weekText("M"),
                      weekText("T"),
                      weekText("W"),
                      weekText("T"),
                      weekText("F"),
                      weekText("S"),
                      weekText(getMonthStarting().toString())
                    ],
                  ),
                  PageView(
                    children: months()[currentIndex].days,
                  )
                ],
              ),
            ), */
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
