// import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:readyplates/modals/login.dart';
import 'package:readyplates/utils/routes.dart';
// import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:readyplates/widgets/login_field.dart';
// import 'dart:io';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ScrollController controller = ScrollController();
  Login? users;

  @override
  void initState() {
    super.initState();
  }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.ImagePage);
      setState(() {
        changeButton = false;
      });
    }
  }

  

  // Future<Login?> logincall(
  //   String username,
  //   String password,
  // ) async {
  //   http.Response response;
  //   response = await http.post(
  //     Uri.parse('http://192.168.0.194:5000/accounts/login/'),
  //     body: jsonEncode(<String, String>{
  //       "username": username,
  //       "password": password,
  //     }),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 201) {
  //     print('object');
  //     return loginFromJson(response.body);
  //   } else {
  //     throw Exception('Failed to create User.');
  //   }
  // }

/*   Widget titleText({required String text, int? some}) {
    return Text(text,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xff2F2E41),
        ));
  } */

  Widget titleText(String text) {
    return Text(text,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xff2F2E41),
        ));
  }

  bool isScrollOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      controller: controller,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: isScrollOpen ? size.height * 0.5 : size.height,
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
                    SizedBox(height: size.height * 0.015),
                    Container(
                      //height: 45,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: MediaQuery.of(context).size.width,
                      child: LoginTextField(
                        controller: emailController,
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
                            color: Color(0xff2F2E41),
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      //height: 45,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: MediaQuery.of(context).size.width,
                      child: LoginTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        validation: MultiValidator(
                          [
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(1,
                                errorText: "More than 6 Required"),
                          ],
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
                    SizedBox(
                      height: 54,
                      width: MediaQuery.of(context).size.width,
                      // ignore: deprecated_member_use
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            color: Color(0xff222831),
                            onPressed: () async {
                              // final String username = emailController.text;
                              // final String password = passwordController.text;
                              // final Login? user =
                              //     await logincall(username, password);
                              // setState(() {
                              //   users = user;
                              // });
                              moveToHome(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Color(0xffFFFFFF)),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 54,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffB9B9B9),
                            side: BorderSide(
                                width: 1.5,
                                color: Color.fromRGBO(255, 255, 255, 0.5)),
                          ),
                          onPressed: () {},
                          child: Wrap(
                            children: <Widget>[
                              // SizedBox(width: 75,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 13, bottom: 14, right: 9),
                                child: Container(
                                    height: 27,
                                    width: 27,
                                    child: Image.asset(
                                        "assets/images/google.png")),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, bottom: 14),
                                child: Text("Continue with google!",
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 17)),
                              ),
                            ],
                          ),
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
