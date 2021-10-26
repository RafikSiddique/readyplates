import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/about_location.dart';
import 'package:readyplates/utils/my_color.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurantModel;
  const RestaurantCard({Key? key, required this.restaurantModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
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
            color: Color.fromRGBO(0, 0, 0, 0.25),
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
            Get.toNamed(RestaurantDetails.id, arguments: restaurantModel);
          },
          child: Padding(
            padding: EdgeInsets.all(media.size.width * 0.025),
            child: Row(
              children: [
                Container(
                  // color: Colors.blue,
                  width: media.size.height * 0.09,
                  height: media.size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: restaurantModel.bio.first.food1 == ""
                      ? Image.asset("assets/images/burger.png")
                      : Image.network(restaurantModel.bio.first.food1),
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
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Restaurent Description",
                        style: GoogleFonts.montserrat(
                          fontSize: media.size.height * 0.013,
                          color: MyTheme.shoptextcolor2,
                        ),
                      ),
                      Text(
                        restaurantModel.address ?? "",
                        style: GoogleFonts.montserrat(
                          fontSize: media.size.height * 0.013,
                          color: MyTheme.shoptextcolor2,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: media.size.height * 0.013,
                            height: media.size.height * 0.013,
                            child: Image.asset('assets/images/star.png'),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            restaurantModel.bio.first.servingTime,
                            style: TextStyle(
                              fontSize: media.size.height * 0.013,
                              //color: Color(0xff767B91),
                              color: MyTheme.shoptextcolor,
                            ),
                          ),
                        ],
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
                      Row(
                        children: [
                          Container(
                            width: media.size.height * 0.013,
                            height: media.size.height * 0.013,
                            child: Image.asset('assets/images/tag.png'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "",
                            style: TextStyle(
                              fontSize: media.size.height * 0.013,
                              color: MyTheme.shoptextcolor2,
                            ),
                          ),
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
