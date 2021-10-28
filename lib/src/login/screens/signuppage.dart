import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates/models/signup.dart';

import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/src/login/screens/loginpage.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/form_field.dart';

class SignupPage extends StatefulWidget {
  static const id = "/signup";
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _checkbox = false;
  final controller = Get.find<AuthController>();

  String? value;

  Signup? abc;
  //bool _isObscure = true;
  // bool _isObscure1 = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, //(0xffE5E5E5),

        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white, //(0xffE5E5E5),
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.black,
              ),
              onPressed: () {
                Get.toNamed(LoginPage.id);
              }),
          centerTitle: true,
          title: Text(
            'User Information',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 17,
              letterSpacing: -0.226667,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFormField(
                    toptext: 'Name',
                    controller: controller.fNamController,
                    hintText: 'First Name',
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(6),
                        topRight: const Radius.circular(6),
                        bottomLeft: const Radius.circular(0),
                        bottomRight: const Radius.circular(0.0)),
                  ),

                  // Text("Name",
                  //     style: TextStyle(
                  //         fontSize: 13,
                  //         fontFamily: 'Inter',
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.w500,
                  //         color: MyTheme.hinttextchangeColor)),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Container(
                  //   height: 45,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: TextFormField(
                  //     controller: controller.fNamController,
                  //     decoration: InputDecoration(
                  //       hintText: 'First Name',
                  //       contentPadding:
                  //           EdgeInsets.only(left: 14, top: 14, bottom: 14),
                  //       hintStyle: TextStyle(
                  //         fontFamily: 'Inter',
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 15,
                  //         letterSpacing: -0.264706,
                  //         color: MyTheme.hinttextColor,
                  //         //color: Color(0xff979797).withOpacity(0.7),
                  //       ),
                  //       // labelText: "First Name",
                  //       border: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(width: 1, color: Color(0xffE0E0E0)),
                  //         borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(6),
                  //           topRight: Radius.circular(6),
                  //           bottomLeft: Radius.circular(0),
                  //           bottomRight: Radius.circular(0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  AppFormField(
                    hintText: 'Last Name',
                    controller: controller.lNameController,
                    toptext: '',
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(0),
                        topRight: const Radius.circular(0),
                        bottomLeft: const Radius.circular(6),
                        bottomRight: const Radius.circular(6)),
                    bottomText:
                        'Make sure it matches the name on your government ID',
                  ),
                  // Container(
                  //   height: 45,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: TextFormField(
                  //     controller: controller.lNameController,
                  //     decoration: InputDecoration(
                  //       hintText: "Last Name",
                  //       contentPadding:
                  //           EdgeInsets.only(left: 14, top: 14, bottom: 14),
                  //       hintStyle: TextStyle(
                  //         fontFamily: 'Inter',
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 15,
                  //         letterSpacing: -0.264706,
                  //         color: MyTheme.hinttextColor,
                  //         //color: Color(0xff979797).withOpacity(0.7),
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(width: 1, color: Color(0xffE0E0E0)),
                  //         borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(0),
                  //           topRight: Radius.circular(0),
                  //           bottomLeft: Radius.circular(6),
                  //           bottomRight: Radius.circular(6),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 3),
                  // Text("Make sure it matches the name on your government ID",
                  //     style: TextStyle(
                  //       fontSize: 9,
                  //       fontFamily: 'Poppins',
                  //       fontStyle: FontStyle.normal,
                  //       fontWeight: FontWeight.normal,
                  //       //color: Color(0xff6E6D7A),
                  //       color: MyTheme.bottomtextColor,
                  //     )),
                  SizedBox(height: 19),
                  Text("Gender",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: MyTheme.hinttextchangeColors,
                        // color: Color(0xff2F2E41),
                        letterSpacing: -0.229412,
                      )),
                  SizedBox(height: 5),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: MyTheme.borderColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: MediaQuery.of(context).size.width,

                    // width: 341,
                    height: 45,
                    child: DropdownButtonFormField<String>(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          right: 12.21,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.chevronDown,
                          color: Colors.black,
                          size: 14.87,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(6.0),
                          // ),
                        ),
                        hintText: 'Gender',
                        contentPadding:
                            EdgeInsets.only(left: 14, top: 14, bottom: 14),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: MyTheme.hinttextColor,
                          //color: Color(0xff979797).withOpacity(0.7),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      items: controller.items
                          .map(
                              (e) => DropdownMenuItem(child: Text(e), value: e))
                          .toList(),
                      onChanged: (newValue) {
                        controller.gender.value =
                            newValue ?? controller.items.first;
                      },
                    ),
                  ),

                  SizedBox(height: 19),
                  Text("Date of Birth",
                      style: TextStyle(
                        fontSize: 13,
                        color: MyTheme.hinttextchangeColors,
                        //color: Color(0xff2F2E41),
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                      )),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: MyTheme.borderColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      onTap: () async {
                        DateTime? dt = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now());
                        if (dt != null) {
                          controller.dobController.text =
                              "${dt.day}/${dt.month}/${dt.year}";
                        }
                      },
                      controller: controller.dobController,
                      decoration: InputDecoration(
                        hintText: 'dd/mm/yyyy',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                          bottom: 14,
                        ),
                        hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: MyTheme.hinttextColor,
                          //color: Color(0xff979797).withOpacity(0.7),
                        ),
                        // labelText: "dd/mm/yyyy",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 19),

                  AppFormField(
                    toptext: 'Email ID',
                    controller: controller.usernameController,
                    hintText: 'username@aol.com',
                  ),

                  // Text("Email ID",
                  //     style: TextStyle(
                  //       fontSize: 13,
                  //       color: MyTheme.hinttextchangeColor,
                  //       //     color: Color(0xff2F2E41),
                  //       fontFamily: 'Inter',
                  //       fontStyle: FontStyle.normal,
                  //       fontWeight: FontWeight.w500,
                  //       letterSpacing: -0.229412,
                  //     )),
                  // SizedBox(height: 5),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,

                  //   // width: 341,
                  //   height: 45,
                  //   child: TextFormField(
                  //     controller: controller.usernameController,
                  //     textAlign: TextAlign.left,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(width: 1, color: Color(0xffE0E0E0)),
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(6.0),
                  //         ),
                  //       ),
                  //       hintText: 'username@aol.com',
                  //       contentPadding: EdgeInsets.only(
                  //         left: 14,
                  //         top: 14,
                  //         bottom: 14,
                  //       ),
                  //       hintStyle: TextStyle(
                  //         fontFamily: 'Inter',
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 15,
                  //         letterSpacing: -0.264706,
                  //         color: MyTheme.hinttextColor,
                  //         //color: Color(0xff979797).withOpacity(0.7),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(height: 19),
                  AppFormField(
                    toptext: 'Mobile',
                    controller: controller.mobController,
                    hintText: '923944543',
                  ),
                  // Text(
                  //   "Mobile",
                  //   style: TextStyle(
                  //     fontSize: 13,
                  //     color: MyTheme.hinttextchangeColor,
                  //     // color: Color(0xff2F2E41),
                  //     fontFamily: 'Inter',
                  //     fontStyle: FontStyle.normal,
                  //     fontWeight: FontWeight.w500,
                  //     letterSpacing: -0.229412,
                  //   ),
                  // ),
                  // SizedBox(height: 5),
                  // Container(
                  //   height: 45,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: TextFormField(
                  //     controller: controller.mobController,
                  //     decoration: InputDecoration(
                  //       hintText: '923944543',
                  //       contentPadding: EdgeInsets.only(
                  //         left: 14,
                  //         top: 14,
                  //         bottom: 14,
                  //       ),
                  //       hintStyle: TextStyle(
                  //         fontSize: 15,
                  //         letterSpacing: -0.264706,
                  //         color: MyTheme.hinttextColor,
                  //         // color: Color(0xff979797).withOpacity(0.7),
                  //       ),
                  //       //labelText: "923944543",
                  //       border: OutlineInputBorder(
                  //           borderSide:
                  //               BorderSide(width: 1, color: Color(0xffE0E0E0)),
                  //           borderRadius: BorderRadius.circular(6.0)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 19),
                  AppFormField(
                    toptext: 'Password',
                    controller: controller.passwordController,
                    hintText: '********',
                    isPassword: true,
                    matchVerification: true,
                    secondVal: controller.password2Controller,
                    line: 1,
                    bottomText:
                        'Atleast 8 characters (Caps, Small & Special Characters)',
                  ),

                  // Text("Password",
                  //     style: TextStyle(
                  //       fontSize: 13,
                  //       color: MyTheme.hinttextchangeColor,
                  //       // color: Color(0xff2F2E41),
                  //       fontFamily: 'Inter',
                  //       fontStyle: FontStyle.normal,
                  //       fontWeight: FontWeight.w500,
                  //       letterSpacing: -0.229412,
                  //     )),
                  // SizedBox(height: 5),
                  // Container(
                  //   height: 45,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: TextFormField(
                  //     obscureText: _isObscure,
                  //     controller: controller.passwordController,
                  //     decoration: InputDecoration(
                  //       suffixIcon: IconButton(
                  //           icon: Icon(_isObscure
                  //               ? Icons.visibility_off
                  //               : Icons.visibility),
                  //           onPressed: () {
                  //             setState(() {
                  //               _isObscure = !_isObscure;
                  //             });
                  //           }),
                  //       hintText: '********',
                  //       contentPadding: EdgeInsets.only(
                  //         left: 14,
                  //         //bottom: 17,
                  //         top: 17,
                  //       ),
                  //       hintStyle: TextStyle(
                  //         fontSize: 15,
                  //         letterSpacing: -0.264706,
                  //         //color: Color(0xff2F2E41).withOpacity(0.7),
                  //         color: MyTheme.hinttextchangeColor,
                  //       ),

                  //       //labelText: "***********",
                  //       border: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(width: 1, color: Color(0xffE0E0E0)),
                  //         borderRadius: BorderRadius.circular(6.0),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  AppFormField(
                    toptext: 'Confirm Password',
                    controller: controller.password2Controller,
                    hintText: '********',
                    isPassword: true,
                    matchVerification: true,
                    secondVal: controller.password2Controller,
                    bottomText: 'Please re-enter password',
                    line: 1,
                  ),

                  // Text("Confirm Password",
                  //     style: TextStyle(
                  //       fontSize: 13,
                  //       // color: Color(0xff2F2E41),
                  //       color: MyTheme.hinttextchangeColor,
                  //       fontFamily: 'Inter',
                  //       fontStyle: FontStyle.normal,
                  //       fontWeight: FontWeight.w500,

                  //       letterSpacing: -0.229412,
                  //       //fontSize: 13,
                  //       // color: Color(0xff2F2E41),
                  //     )),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Container(
                  //   height: 45,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: TextFormField(
                  //     controller: controller.password2Controller,
                  //     obscureText: _isObscure1,
                  //     decoration: InputDecoration(
                  //       suffixIcon: IconButton(
                  //           icon: Icon(_isObscure1
                  //               ? Icons.visibility_off
                  //               : Icons.visibility),
                  //           onPressed: () {
                  //             setState(() {
                  //               _isObscure1 = !_isObscure1;
                  //             });
                  //           }),

                  //       hintText: '********',

                  //       contentPadding: EdgeInsets.only(
                  //         left: 14,
                  //         top: 17,
                  //         // bottom: 17,
                  //       ),
                  //       hintStyle: TextStyle(
                  //         fontSize: 15,
                  //         letterSpacing: -0.264706,
                  //         // color: Color(0xff2F2E41).withOpacity(0.7),
                  //         color: MyTheme.hinttextchangeColor,
                  //       ),

                  //       //] labelText: "***********",
                  //       border: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(width: 1, color: Color(0xffE0E0E0)),
                  //         borderRadius: BorderRadius.circular(6.0),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Text("Strong",
                  //       style: TextStyle(
                  //         fontSize: 9,
                  //         color: MyTheme.bottomtextColor,
                  //         fontFamily: 'Poppins',
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.normal,
                  //         letterSpacing: -0.229412,
                  //       )),
                  // ),
                  // SizedBox(height: 1),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _checkbox,
                        checkColor: MyTheme.checkboxcolor,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                      Text('I have a referral code',
                          style: TextStyle(
                            fontSize: 13,
                            color: MyTheme.checkboxtextcolor,
                            // color: Color(0xff3C3B4D),
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.229412,
                          )),
                    ],
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      formKey.currentState!.save();
                      await controller.register();
                      //Navigator.pushNamed(context, MyRoutes.LoginPage);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      //width:size.width,
                      height: 45,
                      decoration: BoxDecoration(
                        // color: Color(0xff222831),
                        color: MyTheme.buttonbackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Inter-Regular',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, //(0xffE5E5E5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      // indent: 16,
                      endIndent: 46,
                      thickness: 2,
                      color: MyTheme.devidercolor,
                    )),
                    Text(
                      "OR",
                      style: TextStyle(
                        color: MyTheme.dividermiddletext,
                        //color: Color(0xff4E535A),
                        fontSize: 13,
                        fontFamily: 'Inter-Regular',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 44,
                      // endIndent: 20,
                      thickness: 2,
                      color: MyTheme.devidercolor,
                      //  color: Color(0xffD8D8D8),
                    )),
                  ]),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        //width: 164,
                        height: 45,
                        color: MyTheme.buttonbackgroundcolor,
                        // color: Color(0xffF2F2F2),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(34, 40, 49, 0.2),
                            side: BorderSide(
                                width: 1.5, color: MyTheme.checkboxcolor),
                          ),
                          onPressed: () {},
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 13, bottom: 14, right: 9),
                                child: Container(
                                    height: 21.5,
                                    width: 20,
                                    child: Image.asset(
                                        Assets.google)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 19, left: 4),
                                child: Text("Continue with google!",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: MyTheme.bottomtextColorsignup,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //width: 164,
                        height: 45,
                        color: MyTheme.buttonbackgroundcolor,
                        // color: Color(0xffF2F2F2),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(34, 40, 49, 0.2),
                            side: BorderSide(
                              width: 1.5,
                              color: MyTheme.checkboxcolor,
                            ),
                          ),
                          onPressed: () {},
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, right: 9),
                                child: Container(
                                    child: Image.asset(Assets.fbb,
                                        height: 30,
                                        width: 33,
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 19,
                                ),
                                child: Text("Continue with facebook!",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      //color: Color(0xff505056),
                                      color: MyTheme.bottomtextColorsignup,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(color: MyTheme.hinttextchangeColor, fontSize: 15),
      ));
}
