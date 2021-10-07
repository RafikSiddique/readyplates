// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/widgets/login_field.dart';

class LoginPage extends StatelessWidget {
  static const id = "/loginpage";
  final AuthController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();

  Widget titleText(String text) {
    return Text(text,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xff374151),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;

    return Scaffold(
        body: SingleChildScrollView(
      controller: scrollController,
      child: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ready.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
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
                  color: Color(0xff979797),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.chevron_left,
                          ),
                          color: Color(0xff393E46),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.OnbordingPage);
                          },
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Text("Login",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xff6E6D7A),
                            )),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: titleText(
                        "Email address / Mobile Number",
                      ),
                    ),
                    SizedBox(height: size.height * 0.010),
                    Container(
                      //height: 45,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: MediaQuery.of(context).size.width,
                      child: LoginTextField(
                        controller: controller.usernameController,
                        hintText: 'Email address / Mobile Number',
                        validation: MultiValidator(
                          [
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(errorText: "not valid"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text("Password",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter-Regular',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff374151),
                          )),
                    ),
                    SizedBox(height: size.height * 0.010),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        obscureText: true,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintText: '********',
                          contentPadding: EdgeInsets.only(
                            left: 14,
                            top: 17,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 15,
                            letterSpacing: -0.264706,
                            color: Color(0xff2F2E41).withOpacity(0.7),
                          ),

                          //labelText: "***********",
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffE0E0E0)),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: const Text('Forget Password',
                                style: TextStyle(
                                    color: Color(0xff32B768), fontSize: 14)),
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
                          Get.snackbar("Error", "Please fill all the details");
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 16, right: 16),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xff222831),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
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
                              color: Color(0xffE5E5E5),
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
                        Navigator.pushNamed(context, MyRoutes.LoginotpScreen);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 16, right: 16),
                        //width:size.width,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          border: Border.all(
                            width: 1,
                            color: Color(0xffB9B9B9),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 26.42,
                              height: 27,
                              child: Image.asset('assets/images/google.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: Text(
                                'Sign up with Google',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter-Regular',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff222222),
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
          ],
        ),
      ),
    ));
  }
}
