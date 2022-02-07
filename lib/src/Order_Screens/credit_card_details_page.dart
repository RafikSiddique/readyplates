import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
// import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/form_field.dart';

class CreditCardDetailsPage extends StatelessWidget {
  const CreditCardDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isCheck = false.obs;
    return Scaffold(
      backgroundColor: MyTheme.appbackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.appbackgroundColor,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: MyTheme.orangeColor,
            ),
            onPressed: () {}),
        centerTitle: true,
        title: Text(
          'Payment',
          style: GoogleFonts.inter(
            fontSize: 17,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: MyTheme.orangeColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17, top: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    minimumSize: Size.fromHeight(45),
                    textStyle: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    primary: MyTheme.iconColor,
                    onPrimary: MyTheme.appbackgroundColor,
                    side: BorderSide(
                      width: 1,
                      color: MyTheme.iconColor,
                    )),
                label: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("PayPal"),
                ),
                icon: Container(
                  height: 31,
                  child: Image(image: AssetImage(Assets.paypal)),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  endIndent: 10,
                  thickness: 1,
                  color: MyTheme.devidercolor,
                )),
                Text("Or pay with card",
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: MyTheme.dividermiddletext,
                    )),
                Expanded(
                    child: Divider(
                  indent: 10,
                  thickness: 1,
                  color: MyTheme.devidercolor,
                )),
              ]),
              SizedBox(
                height: 30,
              ),
              AppFormField(
                toptext: 'Email',
                hintText: 'Example@123',
                controller: TextEditingController(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              SizedBox(
                height: 16,
              ),
              AppFormField(
                formatters: [FilteringTextInputFormatter.digitsOnly],
                inputType: TextInputType.number,
                toptext: 'Card Information',
                hintText: '1234 1233 1233 1233',
                suffixIcon: Icon(
                  Icons.error,
                  color: MyTheme.errorIcon,
                  size: 14,
                ),
                controller: TextEditingController(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: MyTheme.borderColor,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "MM/YY",
                            hintStyle: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.hinttextColor),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 0,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: MyTheme.borderColor),
                        ),
                      ),
                      Container(
                        width: 180,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "CVV",
                            hintStyle: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.hinttextColor),
                            suffixIcon: Padding(
                                padding: const EdgeInsets.only(left: 26),
                                child: Container(
                                    height: 12,
                                    width: 12,
                                    child: Image.asset(
                                        "assets/images/creditcard.png"))),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              AppFormField(
                toptext: "Name On Card",
                hintText: "ABCD",
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Country region",
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.hinttextchangeColors),
                  )),
              SizedBox(
                height: 7,
              ),
              Container(
                // height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: MyTheme.borderColor,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                ),
                child: DropdownButtonFormField(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      right: 12.21,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.chevronDown,
                      color: MyTheme.iconColor,
                      size: 14.83,
                    ),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Select City',
                    contentPadding: EdgeInsets.only(
                      left: 14,
                      top: 14,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.hinttextColor,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(child: Text(""), value: ""),
                    DropdownMenuItem(child: Text("USA"), value: "USA"),
                  ],
                  onChanged: (newValue) {},
                ),
              ),
              AppFormField(
                formatters: [FilteringTextInputFormatter.digitsOnly],
                inputType: TextInputType.number,
                toptext: '',
                hintText: 'ZIP',
                controller: TextEditingController(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: Get.height, maxWidth: Get.width * 0.07),
                        child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: MyTheme.orangeColor,
                            checkColor: Colors.white,
                            value: isCheck.value,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            tristate: false,
                            onChanged: (value) {
                              isCheck.value = !isCheck.value;
                            }),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Use this for all future payements',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: isCheck.value == true
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: MyTheme.bottomtextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  minimumSize: Size.fromHeight(45),
                  textStyle: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                  primary: MyTheme.orangeColor,
                  onPrimary: MyTheme.appbackgroundColor,
                  // side: BorderSide(
                  //   width: 1,
                  //   color: MyTheme.iconColor,
                  // )
                ),
                // child: Text("Pay \$ ${orderModelApi.totalPrice}"),
                child: Text("Save Card Details"),
                onPressed: () async {
                  Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
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
                  await Get.find<AuthController>().setCardDetails();

/*                   if (isOrderComplete) {
                    Get.find<OrderController>()
                        .updateStatus(orderModelApi.id, 2);
                    Get.find<OrderController>().getorder();
                    Get.offAll(() => FeedbackPage(
                          e: orderModelApi,
                          isComplete: true,
                        ));
                  } else {
                    Get.find<HomeController>().currentIndex.value = 2;
                    Get.find<HomeController>().onPageChanged(2);
                    Get.find<OrderController>().getorder();

                    Navigator.pushNamedAndRemoveUntil(
                        context, LandingPage.id, (route) => false);
                  } */
                },
              ),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
