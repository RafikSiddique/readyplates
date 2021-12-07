import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/order/screen/booking_details.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/food_item_card.dart';

class MenuPage extends StatelessWidget {
  static const id = "/menupage";
  final RestaurantModel restaurantModel;
  final controller = Get.find<HomeController>();
  final orderController = Get.find<OrderController>();
  final bool isEditing;
  MenuPage({Key? key, required this.restaurantModel, this.isEditing = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return WillPopScope(
      onWillPop: () async {
        if (isEditing) {
          if (orderController.orderEdit.isEmpty) {
            Navigator.pushNamedAndRemoveUntil(
                context, LandingPage.id, (route) => false);
            return true;
          } else {
            return true;
          }
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.backgroundcolor,
        appBar: AppBar(
          backgroundColor: MyTheme.backgroundcolor,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: MyTheme.appbartextColor,
              ),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            restaurantModel.resName,
            style: TextStyle(
              fontSize: 17,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: Obx(() => Container(
              //   height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 47,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: MyTheme.appbackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(230, 230, 230, 0.547886),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        controller.searchFoor(
                            value, restaurantModel.id.toString());
                      },
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: GoogleFonts.inter(
                              fontSize: 15.0,
                              color: MyTheme.appbartextColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 30,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none, gapPadding: 2)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "MAIN COURSE",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.dividermiddletext,
                        ),
                      ),
                    ),
                  ),
                  if (controller.foodItems.isEmpty)
                    Container(
                      alignment: Alignment.center,
                      child: Text("No Food Item in the menu"),
                    )
                  else if (controller.foodItems.first.id == -1)
                    Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  else
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: controller.foodItems.map(
                          (e) {
                            return FoodItemCard(
                                restaurantModel: restaurantModel,
                                isEditing: isEditing,
                                foodItemModel: e);
                          },
                        ).toList(),
                      ),
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Obx(() => Elevated(
                        text: "Proceed to Booking",
                        width: double.infinity,
                        backgroundColor: (isEditing
                                ? orderController.orderEdit.isNotEmpty
                                : orderController.cartItems.any((element) =>
                                    element.restaurant == restaurantModel.id))
                            ? MyTheme.buttonbackgroundColor
                            : MyTheme.hinttextColor,
                        onTap: () {
                          if (isEditing) {
                            Get.back();
                          } else {
                            bool check = orderController.cartItems.any(
                                (element) =>
                                    element.restaurant == restaurantModel.id);
                            if (!check) {
                              Get.snackbar("Please add an item",
                                  "At least add atleast 1 item from this restaurant to proceed to booking");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookingDetails(
                                        restaurantModel, isEditing),
                                  ));
                            }
                          }
                        },
                      )),
                  SizedBox(
                    height: 17,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
