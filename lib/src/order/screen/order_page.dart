import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/order/screen/Order_cancel_page.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/imagewidget.dart';
import 'package:readyplates/widgets/order_widget.dart';

class PopUpMenuWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String path;
  final Color color;
  const PopUpMenuWidget(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.path,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      /* () {
                
              }, */
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ImagewidgetPage(
          imagePath: path, // '',
          width: 15,
          height: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text, //"Edit Order",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: color, // ,
              fontSize: 12),
        )
      ]),
    );
  }
}

class OrderPage extends GetView<OrderController> {
  final Function() goToShopping;
  OrderPage(this.goToShopping, {Key? key}) : super(key: key);
  Future<void> editOrder(BuildContext context, OrderModelApi orderModel) async {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox.square(
          dimension: Get.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                  dimension: 100,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        MyTheme.borderchangeColor),
                  )),
            ],
          ),
        ),
      ),
    );
    RestaurantModel restaurantModel =
        await controller.getSingleRestaurant(orderModel.restaurant.id);

    controller.orderId = orderModel.id;

    controller.orderEdit.value = orderModel.orderitems
        .map((e) => OrderEditModel(
            foodName: e.menu.name,
            orderId: orderModel.id,
            id: e.id,
            foodItem: RxInt(e.menu.id),
            foodQuantity: RxInt(e.quantity),
            foodPrice: RxDouble(double.parse(e.price)),
            restaurant: orderModel.restaurant.id,
            foodImage: e.menu.image1,
            isUpdated: false))
        .toList();
    controller.calclateTotal(true);
    Navigator.pop(context);
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => BurgersupportingPage(
            restaurantModel: restaurantModel,
            isEditing: orderModel.status.index == 0
                ? Editing.unconfirmed
                : Editing.confirmed,
            orderModelApi: orderModel,
          ),
        ));
  }

  void showTextMenu({
    required TapDownDetails details,
    required BuildContext context,
    required OrderModelApi orderModel,
    required int restaurantId,
  }) {
    final RenderBox overlay = context.findRenderObject() as RenderBox;

    showMenu(
        context: context,
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.zero,
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          side: BorderSide(
            color: MyTheme.orderbordercolor,
          ),
        ),
        useRootNavigator: false,
        color: Colors.white,
        position: RelativeRect.fromRect(
            details.globalPosition & Size(40, 40), Offset.zero & overlay.size),
        items: <PopupMenuEntry>[
          PopupMenuItem(
              height: 20,
              onTap: () async {
                editOrder(context, orderModel);
              },
              child: PopUpMenuWidget(
                onTap: () async {
                  editOrder(context, orderModel);
                },
                text: "Edit Order",
                path: Assets.notePencil,
                color: MyTheme.orderpopupcolor,
              )),
          PopupMenuDivider(
            height: 12,
          ),
          PopupMenuItem(
              height: 20,
              padding: EdgeInsets.zero,
              onTap: null,
              child: PopUpMenuWidget(
                onTap: () async {
                  await controller.updateStatus(
                      orderModel.id, OrderState.cancelled);
                  Get.to(() => OrderCancelledPage());
                },
                path: Assets.checkCircle,
                text: "Cancel Order",
                color: MyTheme.orderpopupcolor,
                //color: Color(0xffF88020),
              )

              // Text("data")
              ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      initState: (state) {
        controller.getorder();
      },
      builder: (c) {
        return Scaffold(
            backgroundColor: MyTheme.backgroundcolor,
            appBar: AppBar(
              backgroundColor: MyTheme.backgroundcolor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Orders",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.appbartextColor),
                ),
              ),
              leading: Container(),
              automaticallyImplyLeading: false,
            ),
            body: FutureBuilder<String?>(
              future: SharedPreferenceHelper().getUserId(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return controller.active.isEmpty &&
                          controller.inProgress.isEmpty &&
                          controller.ended.isEmpty &&
                          controller.Served.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: MediaQuery.of(context).size.width * 0.2,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "No Orders at the moment",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Elevated(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width,
                                  text: "Order Now",
                                  onTap: () {
                                    goToShopping();
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 16, right: 16),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.active.isNotEmpty)
                                    Text("ACTIVE",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              color: MyTheme.dividermiddletext),
                                        )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: controller.active
                                        .map(
                                          (element) => OrderWidget(
                                            orderModel: element,
                                            showMenu: (details) {
                                              showTextMenu(
                                                  details: details,
                                                  context: context,
                                                  restaurantId:
                                                      element.restaurant.id,
                                                  orderModel: element);
                                            },
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ////////
                                  if (controller.inProgress.isNotEmpty)
                                    Text(
                                      "In progress".toUpperCase(),
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: MyTheme.dividermiddletext),
                                      ),
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: controller.inProgress
                                          .map((e) => OrderWidget(
                                                orderModel: e,
                                                showMenu: (p0) {
                                                  showTextMenu(
                                                      details: p0,
                                                      restaurantId:
                                                          e.restaurant.id,
                                                      context: context,
                                                      orderModel: e);
                                                },
                                              ))
                                          .toList()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ////////////
                                  /// ////////
                                  if (controller.Served.isNotEmpty)
                                    Text(
                                      "Food Served".toUpperCase(),
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: MyTheme.dividermiddletext),
                                      ),
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: controller.Served.map((e) =>
                                          OrderWidget(
                                            orderModel: e,
                                            showMenu: (p0) {
                                              showTextMenu(
                                                  details: p0,
                                                  restaurantId: e.restaurant.id,
                                                  context: context,
                                                  orderModel: e);
                                            },
                                          )).toList()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ////////////
                                  if (controller.ended.isNotEmpty)
                                    Text(
                                      "PREVIOUS COMPLETED ORDERS ",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: MyTheme.dividermiddletext),
                                      ),
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: controller.ended
                                          .map((e) => OrderWidget(
                                                orderModel: e,
                                                showMenu: (p0) {},
                                              ))
                                          .toList()),
                                ],
                              ),
                            ),
                          ),
                        );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 9),
                      child: Column(
                        children: [
                          //Image.asset('assets/images/login.png'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Login to start ordering",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: MyTheme.textformtextcolor,
                              ),
                            ),
                          ),
                          Elevated(
                              text: "Login",
                              backgroundColor:
                                  Color(0xffFF7622).withOpacity(0.6),
                              width: double.infinity,
                              onTap: () {
                                Routes.push(
                                    page: OnbordingPage(
                                  nextPage: LandingPage(),
                                  until: Routes.getName(LandingPage),
                                ));
                              })
                        ],
                      ),
                    ),
                  );
                }
              },
            ));
      },
    );
  }
}
