import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/src/order/screen/booking_details.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/edit_button.dart';

class ShopPage extends StatefulWidget {
  static const id = "/shopPage";
  ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MapPage.id);
            }),
        centerTitle: true,
        title: Text(
          'Sloppy Joe Burgers',
          style: TextStyle(
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: MyTheme.hinttextColor,
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
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 16,
                        icon: FaIcon(
                          FontAwesomeIcons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {}),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: MyTheme.appbartextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
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
              SizedBox(
                height: 12,
              ),
              ...controller.foodItems
                  .map(
                    (e) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.all(7),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/image1.png",
                                          // getUrl(e.image1),
                                          fit: BoxFit.cover,
                                          height: size.width * 0.22,
                                          width: size.width * 0.22,
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: cartItems.any(
                                                (el) => el.id.value == e.id)
                                            ? Obx(() => IncDecButton(
                                                  text: cartItems
                                                      .firstWhere((element) =>
                                                          element.id.value ==
                                                          e.id)
                                                      .quantity
                                                      .value
                                                      .toString(),
                                                  widthFraction: .18,
                                                  onIncrement: () {
                                                    cartItems
                                                        .firstWhere((element) =>
                                                            element.id.value ==
                                                            e.id)
                                                        .quantity++;
                                                  },
                                                  onDecrement: () {
                                                    if (cartItems
                                                            .firstWhere(
                                                                (element) =>
                                                                    element.id
                                                                        .value ==
                                                                    e.id)
                                                            .quantity
                                                            .value ==
                                                        1) {
                                                      cartItems.removeWhere(
                                                          (element) =>
                                                              element
                                                                  .id.value ==
                                                              e.id);
                                                      setState(() {});
                                                    } else {
                                                      cartItems
                                                          .firstWhere(
                                                              (element) =>
                                                                  element.id
                                                                      .value ==
                                                                  e.id)
                                                          .quantity--;
                                                    }
                                                  },
                                                ))
                                            : AddButton(
                                                widthFraction: 0.18,
                                                onTap: () {
                                                  cartItems.add(CartModel(
                                                      id: e.id.obs,
                                                      quantity: 1.obs));
                                                  setState(() {});
                                                },
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.05),
                                      ),
                                    ),
                                    Text(
                                      e.description,
                                      style: GoogleFonts.montserrat(
                                          fontSize: size.width * 0.03),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Image.asset((e.diet_type == "Veg"
                                            ? "assets/images/veg.png"
                                            : "assets/images/nonveg.png")),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ...List.generate(
                                          double.parse(e.spice_level).toInt(),
                                          (index) => Image.asset(
                                            'assets/images/spice.png',
                                            color: index == 0
                                                ? MyTheme
                                                    .shoppageimgcolor //Color(0xff25A244)
                                                : null,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          e.cost,
                                          style: TextStyle(
                                            fontFamily: 'Inter-Bold',
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
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
              Elevated(
                text: "Proceed to Booking",
                width: double.infinity,
                backgroundColor: cartItems.isEmpty
                    ? MyTheme.hinttextColor
                    : MyTheme.buttonbackgroundColor,
                onTap: () {
                  if (cartItems.isEmpty) {
                    Get.snackbar("Please add an Item",
                        "At least add 1 Item to proceed to booking");
                  } else {
                    Get.toNamed(BookingDetails.id);
                  }
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
