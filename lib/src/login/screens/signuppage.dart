import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:readyplates/modals/signup.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/utils/routes.dart';

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
  bool _isObscure = true;
  bool _isObscure1 = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Color(0xffE5E5E5),
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Color(0xff000000),
              ),
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.LoginPage);
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
              color: Color(0xff393E46),
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
                  Text("Name",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2F2E41),

                        //  color: Color(0xff2F2E41),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: controller.fNamController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        contentPadding:
                            EdgeInsets.only(left: 14, top: 14, bottom: 14),
                        hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        // labelText: "First Name",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: controller.lNameController,
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        contentPadding:
                            EdgeInsets.only(left: 14, top: 14, bottom: 14),
                        hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text("Make sure it matches the name on your government ID",
                      style: TextStyle(
                        fontSize: 9,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff6E6D7A),
                      )),
                  SizedBox(height: 19),
                  Text("Gender",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2F2E41),
                        letterSpacing: -0.229412,
                      )),
                  SizedBox(height: 5),

                  Container(
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
                          color: Color(0xff000000),
                          size: 14.87,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: 'Gender',
                        contentPadding:
                            EdgeInsets.only(left: 14, top: 14, bottom: 14),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
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

                  // Container(
                  //    height: 45,
                  //   margin: EdgeInsets.only(left: 16, right: 16),
                  //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(6),
                  //     border: Border.all(color: Color(0xffE0E0E0), width: 1),
                  //   ), //2F2E41, #E0E0E0,2F2E41

                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton<String>(
                  //         value: valueChoose,
                  //         iconSize: 36,
                  //         icon: Icon(
                  //           Icons.arrow_drop_down,
                  //           color: Color(0xff000000),
                  //         ),
                  //         isExpanded: true,
                  //         items: items.map(buildMenuItem).toList(),
                  //         onChanged: (value) => setState(() {
                  //               valueChoose = value.toString();
                  //               gender = valueChoose;
                  //             })),
                  //   ),
                  // ),

                  SizedBox(height: 19),
                  Text("Date of Birth",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                      )),
                  SizedBox(height: 5),
                  Container(
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
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        // labelText: "dd/mm/yyyy",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 19),

                  Text("Email ID",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                      )),
                  SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width,

                    // width: 341,
                    height: 45,
                    child: TextFormField(
                      controller: controller.usernameController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: 'username@aol.com',
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
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 19),
                  Text(
                    "Mobile",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff2F2E41),
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: controller.mobController,
                      decoration: InputDecoration(
                        hintText: '923944543',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                          bottom: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        //labelText: "923944543",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffE0E0E0)),
                            borderRadius: BorderRadius.circular(6.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Text("Password",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                      )),
                  SizedBox(height: 5),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      obscureText: _isObscure,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        hintText: '********',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          //bottom: 17,
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
                  SizedBox(height: 20),
                  Text("Confirm Password",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),

                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,

                        letterSpacing: -0.229412,
                        //fontSize: 13,
                        // color: Color(0xff2F2E41),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: controller.password2Controller,
                      obscureText: _isObscure1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure1
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure1 = !_isObscure1;
                              });
                            }),

                        hintText: '********',

                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 17,
                          // bottom: 17,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),

                        //] labelText: "***********",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Strong",
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xff6E6D7A),
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          letterSpacing: -0.229412,
                        )),
                  ),
                  // SizedBox(height: 1),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _checkbox,
                        checkColor: Color(0xffB9B9B9),
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                      Text('I have a referral code',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff3C3B4D),
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
                        color: Color(0xff222831),
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
                            color: Color(0xffE5E5E5),
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
                      color: Color(0xffD8D8D8),
                    )),
                    Text(
                      "OR",
                      style: TextStyle(
                        color: Color(0xff4E535A),
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
                      color: Color(0xffD8D8D8),
                    )),
                  ]),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        //width: 164,
                        height: 45,
                        color: Color(0xffF2F2F2),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(34, 40, 49, 0.2),
                            side: BorderSide(
                                width: 1.5, color: Color(0XFFB9B9B9)),
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
                                        "assets/images/google.png")),
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
                                      color: Color(0xff505056),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        //width: 164,
                        height: 45,
                        color: Color(0xffF2F2F2),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(34, 40, 49, 0.2),
                            side: BorderSide(
                                width: 1.5, color: Color(0xffB9B9B9)),
                          ),
                          onPressed: () {},
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, right: 9),
                                child: Container(
                                    child: Image.asset("assets/images/fbb.png",
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
                                      color: Color(0xff505056),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),

//
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
        style: TextStyle(color: Color(0xff2F2E41), fontSize: 15),
      ));
}
