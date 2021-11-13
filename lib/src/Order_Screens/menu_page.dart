import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/order/screen/booking_details.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/edit_button.dart';

class MenuPage extends StatelessWidget {
  static const id = "/menupage";
  final RestaurantModel restaurantModel;
  final controller = Get.find<HomeController>();
  final orderController = Get.find<OrderController>();

  MenuPage({Key? key, required this.restaurantModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return Scaffold(
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
                      children: controller.foodItems
                          .map(
                            (e) => Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              shadowColor: Color.fromRGBO(188, 202, 224, 0.5),
                              margin: EdgeInsets.only(top: 10),
                              elevation: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox.square(
                                      dimension: size.width * 0.27,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  e.image1,
                                                  fit: BoxFit.cover,
                                                  height: size.width * 0.22,
                                                  width: size.width * 0.22,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.asset(
                                                        Assets.categoryBurger);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: orderController.cartItems
                                                        .any((el) =>
                                                            el.foodItem.value ==
                                                                e.id &&
                                                            el.restaurant ==
                                                                restaurantModel
                                                                    .id)
                                                    ? IncDecButton(
                                                        text: orderController
                                                            .getCartItem(e.id)
                                                            .foodQuantity,
                                                        widthFraction: .18,
                                                        onIncrement: () {
                                                          orderController
                                                              .increment(
                                                                  e.id,
                                                                  restaurantModel
                                                                      .id);
                                                        },
                                                        onDecrement: () {
                                                          orderController
                                                              .decrement(
                                                                  e.id,
                                                                  restaurantModel
                                                                      .id);
                                                        },
                                                      )
                                                    : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.15),
                                                              offset:
                                                                  Offset(0, 2),
                                                              blurRadius: 6,
                                                              spreadRadius: 1,
                                                            ),
                                                          ],
                                                        ),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.030,
                                                        child: AddButton(
                                                          widthFraction: 0.18,
                                                          onTap: () {
                                                            if (orderController
                                                                .cartItems
                                                                .any((element) =>
                                                                    element
                                                                        .restaurant !=
                                                                    restaurantModel
                                                                        .id)) {
                                                              Get.showSnackbar(
                                                                  GetBar(
                                                                title: "Error",
                                                                message:
                                                                    "Sorry you cannot add items from 2 Restaurant",
                                                                isDismissible:
                                                                    true,
                                                                mainButton:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () async {
                                                                    await orderController
                                                                        .removeAllFromRes(
                                                                            restaurantModel.id);
                                                                    Get.back();
                                                                  },
                                                                  child: Text(
                                                                      "Remove all from other restaurants"),
                                                                ),
                                                              ));
                                                            } else {
                                                              CartModel cartModel = CartModel(
                                                                  foodItem:
                                                                      e.id.obs,
                                                                  foodName:
                                                                      e.name,
                                                                  foodImage:
                                                                      e.image1,
                                                                  foodPrice:
                                                                      double.parse(e
                                                                              .cost)
                                                                          .obs,
                                                                  restaurant:
                                                                      restaurantModel
                                                                          .id,
                                                                  user: "",
                                                                  foodQuantity:
                                                                      1.obs);
                                                              orderController
                                                                  .cartItems
                                                                  .add(
                                                                      cartModel);
                                                              orderController
                                                                  .cart(
                                                                      cartModel);
                                                            }
                                                          },
                                                        ),
                                                      ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: size.width * 0.25,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 8),
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                e.name,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16,
                                                    color: MyTheme
                                                        .buttonchangeColor),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Container(
                                              height: 45,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: Text(
                                                    e.description,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 9,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                e.dietType == "1"
                                                    ? SvgPicture.asset(
                                                        "assets/images/vegan.svg",
                                                        height: 20,
                                                        width: 20,
                                                      )
                                                    : Image.asset(
                                                        ("assets/images/veg.png"),
                                                        color: e.dietType == "2"
                                                            ? Color(0xffBC580B)
                                                            : null,
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ...List.generate(
                                                  double.parse(e.spiceLevel)
                                                      .toInt(),
                                                  (index) => Image.asset(
                                                    Assets.spice,
                                                    color: index == 0
                                                        ? MyTheme
                                                            .shoppageimgcolor //Color(0xff25A244)
                                                        : null,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text("\$ " + e.cost,
                                                    style: GoogleFonts.inter(
                                                      color: MyTheme.pricecolor,
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                SizedBox(
                                                  width: 20,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Obx(() => Elevated(
                      text: "Proceed to Booking",
                      width: double.infinity,
                      backgroundColor: orderController.cartItems.isEmpty
                          ? MyTheme.hinttextColor
                          : MyTheme.buttonbackgroundColor,
                      onTap: () {
                        if (orderController.cartItems.isEmpty) {
                          Get.snackbar("Please add an Item",
                              "At least add 1 Item to proceed to booking");
                        } else {
                          Get.toNamed(BookingDetails.id,
                              arguments: restaurantModel);
                        }
                      },
                    )),
                SizedBox(
                  height: 17,
                )
              ],
            ),
          )),
    );
  }
}
