import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/src/login/screens/loginpage.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/form_field.dart';
import 'package:readyplates/widgets/snackbar.dart';

class SignupPage extends StatefulWidget {
  static const id = "/signup";
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // bool _checkbox = false;
  final controller = Get.find<AuthController>();

  String? value;

  // Signup? abc;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white, //(0xffE5E5E5),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: IconButton(
                iconSize: 14.83,
                icon: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: MyTheme.orangeColor,
                ),
                onPressed: () {
                  Get.toNamed(LoginPage.id);
                }),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'User Information',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 17,
                color: MyTheme.orangeColor,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
              child: Column(
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
                  // SizedBox(
                  //   height: 2,
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
                  SizedBox(height: 19),
                  Text("Gender",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: MyTheme.hinttextchangeColors,
                        //color: Color(0xff2F2E41),
                        // fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(height: 5),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.gender.value == ''
                              ? MyTheme.borderColor
                              : MyTheme.borderchangeColor,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: MediaQuery.of(context).size.width,

                      // width: 341,
                      height: 48,
                      child: DropdownButtonFormField<String>(
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: MyTheme.hinttextchangeColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
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
                        value: controller.value,
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
                            hintStyle: GoogleFonts.inter(
                              fontSize: 15,
                              color: MyTheme.hinttextColor,
                              //color: Color(0xff979797).withOpacity(0.7),
                              // fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            )),
                        items: controller.items
                            .map((e) =>
                                DropdownMenuItem(child: Text(e), value: e))
                            .toList(),
                        onChanged: (newValue) {
                          controller.gender.value =
                              newValue ?? controller.items.first;
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 19),
                  Text("Date of Birth",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: MyTheme.hinttextchangeColors,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.dobController.text.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: MyTheme.hinttextchangeColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
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
                        print(controller.dobController.text);
                      },
                      controller: controller.dobController,
                      decoration: InputDecoration(
                        hintText: 'dd/mm/yyyy',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                          bottom: 14,
                        ),
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          color: MyTheme.hinttextColor,
                          //color: Color(0xff979797).withOpacity(0.7),
                          // fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
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
                    // fontSize: 13,
                    // //fontWeight: FontWeight.w500,
                    // fontFamily: 'Inter-Regular',
                    controller: controller.usernameController,
                    hintText: 'username@aol.com',
                  ),
                  SizedBox(height: 19),
                  AppFormField(
                    toptext: 'Mobile',
                    controller: controller.mobController,
                    hintText: '+1 808 569 2700',
                    inputType: TextInputType.phone,
                  ),
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
                  // SizedBox(height: 15),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   // crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     ConstrainedBox(
                  //       constraints:
                  //           BoxConstraints(maxHeight: 19, maxWidth: 19),
                  //       child: Checkbox(
                  //         value: _checkbox,
                  //         checkColor: Color(0xffADB5BD),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4),
                  //         ),
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _checkbox = !_checkbox;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(width: 5),
                  //     Text('I have a referral code',
                  //         style: GoogleFonts.inter(
                  //           fontSize: 13,
                  //           color: MyTheme.checkboxcolor,
                  //           // color: Color(0xff3C3B4D),
                  //           //fontFamily: 'Inter',
                  //           fontStyle: FontStyle.normal,
                  //           fontWeight: FontWeight.w500,
                  //         )),
                  //   ],
                  // ),
                  SizedBox(height: 20),
                  AnimatedBuilder(
                      animation: Listenable.merge([
                        controller.fNamController,
                        controller.lNameController,
                        controller.dobController,
                        controller.usernameController,
                        controller.mobController,
                        controller.passwordController,
                        controller.password2Controller,
                      ]),
                      builder: (context, child) {
                        return InkWell(
                          onTap: () async {
                            Get.showSnackbar(
                              MySnackBar.myLoadingSnackBar(
                                title: 'Info',
                                message: "Loading...",
                                icon: Center(
                                  child: SizedBox.square(
                                    dimension: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: MyTheme.orangeColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              await controller.register();
                            }
                            //Get.back();
                            //Navigator.pushNamed(context, MyRoutes.LoginPage);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,

                            //width:size.width,
                            height: 45,
                            decoration: BoxDecoration(
                              // color: Color(0xff222831),
                              color: (controller.fNamController.text.isEmpty ||
                                      controller.lNameController.text.isEmpty ||
                                      controller
                                          .usernameController.text.isEmpty ||
                                      controller.mobController.text.isEmpty ||
                                      controller
                                          .passwordController.text.isEmpty ||
                                      controller
                                          .password2Controller.text.isEmpty)
                                  ? MyTheme.verifyButtonColor
                                  : MyTheme.orangeColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Center(
                              child: Text('CONTINUE',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 17,
                                    //fontFamily: 'Inter-Regular',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: (controller
                                                .fNamController.text.isEmpty ||
                                            controller
                                                .lNameController.text.isEmpty ||
                                            controller.usernameController.text
                                                .isEmpty ||
                                            controller
                                                .mobController.text.isEmpty ||
                                            controller.passwordController.text
                                                .isEmpty ||
                                            controller.password2Controller.text
                                                .isEmpty)
                                        ? MyTheme.verifyTextColor
                                        : MyTheme
                                            .appbackgroundColor, //(0xffE5E5E5),
                                  )),
                            ),
                          ),
                        );
                      }),

                  SizedBox(height: 16),
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
