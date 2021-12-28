import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/bio.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/restaurant_detail.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class RestaurantCard extends GetView<HomeController> {
  final RestaurantModel restaurantModel;
  final HomeController controller;
  const RestaurantCard(
      {Key? key, required this.restaurantModel, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Bio bio = restaurantModel.bio.length > 0
        ? restaurantModel.bio.first
        : Bio(
            id: 0,
            description: "",
            no_of_tables: "",
            max_table_size: "",
            cost_for_two: "",
            servingTime: "",
            recurring_event_date: "",
            recur_freq: "",
            event_start: "",
            event_end: "",
            event_desc: "",
            front_fascia_day: "",
            front_fascia_night: "",
            street_view: "",
            entrance: "",
            ambience1: "",
            ambience2: "",
            ambience3: "",
            ambience4: "",
            food1: "",
            food2: "",
            food3: "",
            food4: "",
            cv19prec1: "",
            cv19prec2: "",
            cv19prec3: "",
            cv19prec4: "",
            completed_till: 0,
            user: 0);

    String toc = restaurantModel.types_of_cusine
        .getRange(
            0,
            restaurantModel.types_of_cusine.length > 3
                ? 3
                : restaurantModel.types_of_cusine.length)
        .join(", ");
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: media.size.width * 0.04,
          vertical: media.size.width * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(188, 202, 224, 0.45),
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            controller.timer?.cancel();
            Navigator.push(
                context,
                CupertinoPageRoute(
                    settings: RouteSettings(name: 'details'),
                    builder: (context) => RestaurantDetails(
                          restaurantModel: restaurantModel,
                        )));

            // Get.to(() => RestaurantDetails(
            //       restaurantModel: restaurantModel,
            //       controller: controller,
            //     ));
          },
          child: Padding(
            padding: EdgeInsets.all(media.size.width * 0.025),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: bio.street_view == ""
                        ? Image.asset(
                            Assets.categoryBurger,
                            width: media.size.height * 0.13,
                            height: media.size.height * 0.13,
                          )
                        : Image.network(
                            bio.street_view,
                            fit: BoxFit.cover,
                            width: media.size.height * 0.13,
                            height: media.size.height * 0.13,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                Assets.categoryBurger,
                                fit: BoxFit.cover,
                                width: media.size.height * 0.13,
                                height: media.size.height * 0.13,
                              );
                            },
                          ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        restaurantModel.resName,
                        style: GoogleFonts.montserrat(
                            fontSize: media.size.height * 0.022,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text.rich(
                        TextSpan(
                            children: restaurantModel.types_of_cusine
                                .getRange(
                                    0,
                                    restaurantModel.types_of_cusine.length > 3
                                        ? 3
                                        : restaurantModel
                                            .types_of_cusine.length)
                                .map((e) => TextSpan(text: e + ", "))
                                .toList()),
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: media.size.height * 0.013,
                          fontWeight: FontWeight.w300,
                          color: MyTheme.shoptextcolor2,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        restaurantModel.address
                                .split(' ')
                                .getRange(
                                    0,
                                    restaurantModel.address.split(' ').length <
                                            2
                                        ? restaurantModel.address
                                            .split(' ')
                                            .length
                                        : 2)
                                .map((e) => e)
                                .join() +
                            " | " +
                            double.parse(restaurantModel.address2)
                                .toStringAsFixed(2) +
                            " mi",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: media.size.height * 0.013,
                          fontWeight: FontWeight.w300,
                          color: MyTheme.shoptextcolor2,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Container(
                            width: media.size.height * 0.012,
                            height: media.size.height * 0.012,
                            child: Image.asset(Assets.star),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          // Text(
                          //   // restaurantModel.bio.first.servingTime,
                          //   "4",
                          //   style: TextStyle(
                          //     fontSize: media.size.height * 0.013,
                          //     //color: Color(0xff767B91),
                          //     color: MyTheme.shoptextcolor,
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 9,
                          // ),
                          Text(
                              (restaurantModel.overall_experience == "0"
                                      ? "--"
                                      : restaurantModel.overall_experience
                                          .toString()) +
                                  " | Serving Time : ${bio.servingTime} mins ",
                              style: GoogleFonts.montserrat(
                                  color: MyTheme.shoptextcolor.withOpacity(0.8),
                                  fontSize: media.size.height * 0.013,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: (media.size.width - media.size.height * 0.18),
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Divider(
                          color: MyTheme.devidercolor,
                          //color: Color(0xffC7CCDB),
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Container(
                            width: media.size.height * 0.018,
                            height: media.size.height * 0.018,
                            child: Image.asset(Assets.tag2),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("30% off upto \$25",
                              style: GoogleFonts.montserrat(
                                  color: MyTheme.shoptextcolor.withOpacity(0.8),
                                  fontSize: media.size.height * 0.013,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
