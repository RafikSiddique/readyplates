// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/src/login/screens/forgot_password_page.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/form_field.dart';
import 'package:readyplates/widgets/readyplates.dart';

class LoginPage extends StatelessWidget {
  static const id = "/loginpage";

  final AuthController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();
  final bool isChangepass;
  LoginPage({
    Key? key,
    this.isChangepass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.onboardingBg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 42, right: 43, top: media.viewPadding.top),
                  child: Hero(tag: "rp", child: ReadyPlatesText()),
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
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
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    iconSize: 14.83,
                                    icon: FaIcon(FontAwesomeIcons.chevronLeft,
                                        color: MyTheme.orangeColor),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Get.back();
                              //   },
                              //   child: Container(
                              //     width: 8,
                              //     height: 14,
                              //     child: Image.asset(
                              //       'assets/images/Path.png',
                              //     ),
                              //   ),
                              // ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                isChangepass == true
                                    ? 'Change Password'
                                    : "Login",
                                style: GoogleFonts.inter(
                                  fontSize: 17,
                                  color: MyTheme.orangeColor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Spacer(
                                flex: 2,
                              )
                            ],
                          ),
                          SizedBox(height: size.height * 0.03),
                          AppFormField(
                              toptext: "Email address",
                              hintText: "someone@example.com",
                              focusNode: controller.userNameFocus,
                              controller: controller.usernameController),
                          SizedBox(height: size.height * 0.010),
                          SizedBox(height: size.height * 0.010),
                          // Obx(() => !controller.isNumber.value
                          //     ?
                          AppFormField(
                              isPassword: true,
                              line: 1,
                              toptext: "Password",
                              hintText: "****",
                              controller: controller.passwordController),
                          // :
                          // Container(
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text("OTP"),
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.center,
                          //           children: [
                          //             for (var i = 0;
                          //                 i < controller.otpFields.length;
                          //                 i++)
                          //               Container(
                          //                 width: 40,
                          //                 height: 50,
                          //                 margin: EdgeInsets.all(8),
                          //                 child: TextField(
                          //                   textAlign: TextAlign.center,
                          //                   style: GoogleFonts.montserrat(
                          //                       fontSize: 18,
                          //                       fontWeight: FontWeight.w600),
                          //                   controller: controller.otpText[i],
                          //                   textAlignVertical:
                          //                       TextAlignVertical.bottom,
                          //                   focusNode:
                          //                       controller.otpFields[i],
                          //                   maxLength: 1,
                          //                   inputFormatters: [
                          //                     FilteringTextInputFormatter
                          //                         .digitsOnly,
                          //                   ],
                          //                   keyboardType:
                          //                       TextInputType.number,
                          //                   decoration: InputDecoration(
                          //                     counterText: "",
                          //                     hintText: (i + 1).toString(),
                          //                     hintStyle: TextStyle(
                          //                       color: Colors.grey.shade300,
                          //                     ),
                          //                     border: OutlineInputBorder(
                          //                       borderSide: BorderSide(
                          //                         width: 1,
                          //                         color: MyTheme.borderColor,
                          //                       ),
                          //                       borderRadius:
                          //                           BorderRadius.circular(
                          //                               6.0),
                          //                     ),
                          //                   ),
                          //                   onChanged: (value) {
                          //                     if (value.length == 1) {
                          //                       controller.otp.value += value;
                          //                       if (i != 5)
                          //                         controller.otpFields[i + 1]
                          //                             .requestFocus();
                          //                     } else {
                          //                       if (i != 0) {
                          //                         controller.otp.value =
                          //                             controller.otp.value
                          //                                 .substring(0, i);
                          //                         controller.otpFields[i - 1]
                          //                             .requestFocus();
                          //                       }
                          //                     }
                          //                   },
                          //                 ),
                          //               )
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   )),
                          SizedBox(
                            height: 3,
                          ),
                          if (isChangepass != true)
                            InkWell(
                              onTap: () {
                                Get.toNamed(ForgotPasswordPage.id);
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Forget Password?",
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff32B768),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(height: 20),
                          AnimatedBuilder(
                              animation: Listenable.merge([
                                controller.usernameController,
                                controller.passwordController,
                              ]),
                              builder: (context, child) {
                                return InkWell(
                                  onTap: () async {
                                    _formKey.currentState!.save();
                                    if (_formKey.currentState!.validate()) {
                                      await controller.login(isChangepass,
                                          issignup: false);
                                    } else {
                                      Get.snackbar("Error",
                                          "Please fill all the details");
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: (controller.usernameController.text
                                                  .isEmpty ||
                                              controller.passwordController.text
                                                  .isEmpty)
                                          ? MyTheme.verifyButtonColor
                                          : MyTheme.orangeColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Obx(() => controller.isLoading.value
                                        ? Center(
                                            child: SizedBox(
                                                height: 40,
                                                width: 40,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 2,
                                                )),
                                          )
                                        : Center(
                                            child: Text(
                                              isChangepass == true
                                                  ? "Proceed"
                                                  : "Login",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Inter-Regular',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                color: (controller
                                                            .usernameController
                                                            .text
                                                            .isEmpty ||
                                                        controller
                                                            .passwordController
                                                            .text
                                                            .isEmpty)
                                                    ? MyTheme.verifyTextColor
                                                    : MyTheme
                                                        .appbackgroundColor,
                                              ),
                                            ),
                                          )),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
