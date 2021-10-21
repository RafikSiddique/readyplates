// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/form_field.dart';
import 'package:readyplates/widgets/readyplates.dart';

class LoginPage extends StatelessWidget {
  static const id = "/loginpage";
  final AuthController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();

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
              image: AssetImage("assets/images/ready.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            alignment: Alignment.bottomCenter,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 42, right: 43, top: media.viewPadding.top),
                  child: ReadyPlatesText(),
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
                      // color: Color(0xff979797),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.chevron_left,
                                ),
                                //color: Color(0xff393E46),
                                color: Colors.black,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Text("Login",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: MyTheme.appbartextColor,
                                  )),
                              Spacer(
                                flex: 3,
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.03),
                          AppFormField(
                              toptext: "Email address / Mobile Number",
                              hintText: "someone@example.com",
                              focusNode: controller.userNameFocus,
                              controller: controller.usernameController),
                          SizedBox(height: size.height * 0.010),
                          Text("Password",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Inter-Regular',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                color: MyTheme.textformtextcolor,
                                // color: Color(0xff374151),
                              )),
                          SizedBox(height: size.height * 0.010),
                          Obx(() => !controller.isNumber.value
                              ? Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: controller.passwordController,
                                    decoration: InputDecoration(
                                      hintText: '**** **** ****',
                                      contentPadding: EdgeInsets.only(
                                        left: 14,
                                        top: 17,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: -0.264706,
                                        //color:
                                        color: MyTheme.hinttextColor,
                                        //Color(0xff9CA3AF).withOpacity(0.7),
                                      ),

                                      //labelText: "***********",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: MyTheme.borderColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (var i = 0;
                                          i < controller.otpFields.length;
                                          i++)
                                        Container(
                                          width: 40,
                                          height: 50,
                                          margin: EdgeInsets.all(8),
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                            controller: controller.otpText[i],
                                            focusNode: controller.otpFields[i],
                                            maxLength: 1,
                                            decoration: InputDecoration(
                                              counterText: "",
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: MyTheme.borderColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              if (value.length == 1) {
                                                controller.otp.value += value;
                                                if (i != 5)
                                                  controller.otpFields[i + 1]
                                                      .requestFocus();
                                              } else {
                                                if (i != 0) {
                                                  controller.otp.value =
                                                      controller.otp.value
                                                          .substring(0, i);
                                                  controller.otpFields[i - 1]
                                                      .requestFocus();
                                                }
                                              }
                                            },
                                          ),
                                        )
                                    ],
                                  ),
                                )),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 13),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Forget Password',
                                  style: TextStyle(
                                      //color: MyTheme.forgetpasslogintext,
                                      color: Color(0xff32B768),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: () async {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              } else {
                                Get.snackbar(
                                    "Error", "Please fill all the details");
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 54,
                              decoration: BoxDecoration(
                                color: MyTheme.buttonbackgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Inter-Regular',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(LoginPage.id);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 54,
                              decoration: BoxDecoration(
                                color: MyTheme.boxdecoration2,
                                border: Border.all(
                                    width: 1, color: MyTheme.checkboxcolor
                                    // color: Color(0xffB9B9B9),
                                    ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 26.42,
                                    height: 27,
                                    child:
                                        Image.asset('assets/images/google.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Login with Google',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Inter-Regular',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: MyTheme.buttontextlogin
                                          //color: Color(0xff222222),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
