import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/utils/assets.dart';

import 'package:readyplates/utils/my_color.dart';

import 'package:readyplates/widgets/form_field.dart';
import 'package:readyplates/widgets/imagewidget.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

// import 'package:smooth_star_rating/smooth_star_rating.dart';
class FeedbackPage extends StatefulWidget {
  static const id = "/FeedbackPage";

  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  File? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }
// } on PlatformException catch (e) {
//   print("object :$e");
// }

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    //var controller;
    return Scaffold(
      backgroundColor: MyTheme.appbackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.appbackgroundColor,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: MyTheme.iconColor,
            ),
            onPressed: () {}),
        centerTitle: true,
        title: Text(
          'Feedback',
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            TextwidgetPage(
              text: 'Rate your overall Experience',
              fontWeight: FontWeight.w500,
              color: MyTheme.appbartextColor,
            ),
            SizedBox(
              height: 9,
            ),
            SmoothStarRating(
              //color: Colors.red,

              starCount: 5,
              size: 30,
              spacing: 22,
              borderColor: Color(0xffFFD000),
            ),

            // CustomElevated(
            //   text: '1',
            //   fontSize: 5,
            //   fontWeight: FontWeight.w400,
            //   color: MyTheme.borderColor,
            //   //  width: 40, //MediaQuery.of(context).size.width,
            // ),
            SizedBox(
              height: 19,
            ),
            TextwidgetPage(
              text: 'Rate your overall Experience',
              fontWeight: FontWeight.w500,
              color: MyTheme.appbartextColor,
            ),
            SizedBox(
              height: 9,
            ),
            SmoothStarRating(
              //color: Colors.red,

              starCount: 5,
              size: 30,
              spacing: 22,
              borderColor: Color(0xffFFD000),
            ),
            // CustomElevated(
            //   text: '1',
            //   fontSize: 5,
            //   fontWeight: FontWeight.w400,
            //   color: MyTheme.borderColor,

            //   //  width: 40, //MediaQuery.of(context).size.width,
            // ),
            SizedBox(
              height: 19,
            ),
            TextwidgetPage(
              text: 'Rate the ambience',
              fontWeight: FontWeight.w500,
              color: MyTheme.appbartextColor,
            ),
            SizedBox(
              height: 9,
            ),
            SmoothStarRating(
              //color: Colors.red,

              starCount: 5,
              size: 30,
              spacing: 22,
              borderColor: Color(0xffFFD000),
            ),
            // CustomElevated(
            //   text: '1',
            //   fontSize: 5,
            //   fontWeight: FontWeight.w400,
            //   color: MyTheme.borderColor,

            //   //  width: 40, //MediaQuery.of(context).size.width,
            // ),
            SizedBox(
              height: 19,
            ),
            TextwidgetPage(
              text: 'Rate the serving time',
              fontWeight: FontWeight.w500,
              color: MyTheme.appbartextColor,
            ),
            SizedBox(
              height: 9,
            ),
            SmoothStarRating(
              //color: Colors.red,

              starCount: 5,

              size: 30,
              spacing: 22,
              borderColor: Color(0xffFFD000),
            ),
            // CustomElevated(
            //   text: '1',
            //   fontSize: 5,
            //   fontWeight: FontWeight.w400,
            //   color: MyTheme.borderColor,

            //   //  width: 40, //MediaQuery.of(context).size.width,
            // ),
            SizedBox(
              height: 19,
            ),
            AppFormFields(
              toptext: '',
              hintText: 'Tell us more about your overall experience',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              controller: controller.feedback,
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              height: 228,
              width: MediaQuery.of(context).size.width,
              color: MyTheme.appbackcolor,
              child: image != null
                  ? Image.file(image!, width: 82, height: 64, fit: BoxFit.cover)
                  : Image.asset(Assets.camera),
            ),
          ],
        ),
      ),
    );
  }
}
