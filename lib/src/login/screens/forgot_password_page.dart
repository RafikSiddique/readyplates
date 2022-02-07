import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/form_field.dart';

import '../auth_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const id = "/forgot";
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controller = Get.find<AuthController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 42, right: 43, top: 50),
                    child: Hero(
                      tag: "rp",
                      child: Material(
                        type: MaterialType.transparency,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: 40,
                              height: 40,
                              child: Image.asset(
                                "assets/images/spoon.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              // width: size.width * 0.6,
                              height: 40,
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'READY',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 30,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: MyTheme.orangeColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Plates'.toUpperCase(),
                                          style: GoogleFonts.montserrat(
                                            fontSize: 30,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w200,
                                            color: MyTheme.orangeColor,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(36),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: kToolbarHeight / 3),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      iconSize: 14.83,
                                      icon: FaIcon(
                                        FontAwesomeIcons.chevronLeft,
                                        color: MyTheme.iconColor,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Hero(
                                    tag: "Forgot Password",
                                    child: Card(
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Forgot Password",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: MyTheme.appbartextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.4,
                          ),
                          AppFormField(
                              toptext: "Email address",
                              hintText: "Registered E-Mail ID",
                              focusNode: controller.userNameFocus,
                              controller: controller.usernameController),
                          SizedBox(
                            height: kToolbarHeight * 0.4,
                          ),
                          AnimatedBuilder(
                              animation: Listenable.merge([
                                controller.usernameController,
                              ]),
                              builder: (context, child) {
                                return InkWell(
                                  onTap: () async {
                                    formKey.currentState!.save();
                                    if (formKey.currentState!.validate()) ;
                                    await controller.forgotPassword();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: controller
                                              .usernameController.text.isEmpty
                                          ? MyTheme.verifyButtonColor
                                          : MyTheme.orangeColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Confirm",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Inter-Regular',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: controller.usernameController
                                                  .text.isEmpty
                                              ? MyTheme.verifyTextColor
                                              : MyTheme.appbackgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
