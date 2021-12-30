import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/form_field.dart';
import 'package:readyplates/widgets/text_widget.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FeedbackPage extends StatefulWidget {
  final OrderModelApi e;
  final bool isComplete;
  static const id = "/feedback";
  const FeedbackPage({
    Key? key,
    required this.isComplete,
    required this.e,
  }) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final controller = Get.find<OrderController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> pickImage({
    required void Function(File) imageFile,
  }) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 3),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        cropStyle: CropStyle.rectangle,
      );
      if (croppedFile != null) {
        imageFile(croppedFile);
      }
    }
  }

  List<String> ratingText = [
    '',
    'Poor',
    'Average',
    'Good',
    'Very Good',
    'Excellent'
  ];
  stringText(double value) {
    if (value == 0.0)
      return ratingText[0];
    else if (value == 1.0)
      return ratingText[1];
    else if (value == 2.0)
      return ratingText[2];
    else if (value == 3.0)
      return ratingText[3];
    else if (value == 4.0)
      return ratingText[4];
    else if (value == 5.0)
      return ratingText[5];
    else
      return ratingText[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(LandingPage.id);
        return true;
      },
      child: Scaffold(
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
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            'Feedback',
            style: GoogleFonts.inter(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Textwidget(
                    text: 'Rate your overall Experience',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothStarRating(
                        rating: controller.rating1,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        allowHalfRating: false,
                        onRatingChanged: (value) {
                          setState(() {
                            controller.rating1 = value;
                            value = value;
                          });
                        },
                        starCount: 5,
                        size: 30,
                        spacing: 22,
                        borderColor: MyTheme.ratingfillColor,
                        color: MyTheme.ratingfillColor,
                      ),
                      Text(
                        stringText(controller.rating1),
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff6E6D7A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Textwidget(
                    text: 'Rate the taste',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothStarRating(
                        rating: controller.rating2,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        allowHalfRating: false,
                        onRatingChanged: (value) {
                          setState(() {
                            controller.rating2 = value;
                            value = value;
                          });
                        },
                        starCount: 5,
                        size: 30,
                        spacing: 22,
                        borderColor: MyTheme.ratingfillColor,
                        color: MyTheme.ratingfillColor,
                      ),
                      Text(stringText(controller.rating2),
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff6E6D7A))),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Textwidget(
                    text: 'Rate the ambience',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothStarRating(
                        rating: controller.rating3,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        allowHalfRating: false,
                        onRatingChanged: (value) {
                          setState(() {
                            controller.rating3 = value;
                            value = value;
                          });
                        },
                        starCount: 5,
                        size: 30,
                        spacing: 22,
                        borderColor: MyTheme.ratingfillColor,
                        color: MyTheme.ratingfillColor,
                      ),
                      Text(stringText(controller.rating3),
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff6E6D7A))),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Textwidget(
                    text: 'Rate the serving time',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothStarRating(
                        rating: controller.rating4,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        allowHalfRating: false,
                        onRatingChanged: (value) {
                          setState(() {
                            controller.rating4 = value;
                            value = value;
                          });
                        },
                        starCount: 5,
                        size: 30,
                        spacing: 22,
                        borderColor: MyTheme.ratingfillColor,
                        color: MyTheme.ratingfillColor,
                      ),
                      Text(
                        stringText(controller.rating4),
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff6E6D7A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AppFormFields(
                    toptext: 'Feedback',
                    hintText: 'Tell us more about your overall experience',
                    controller: controller.feedback,
                    hintfontSize: 12,
                    line: 5,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  InkWell(
                      onTap: () {
                        pickImage(
                          imageFile: (p0) {
                            controller.imgs = p0;
                            setState(() {});
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyTheme.containerColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        height: 228,
                        width: MediaQuery.of(context).size.width,
                        child: controller.imgs == null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        'assets/images/camera.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Add Image',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: MyTheme.imgtextColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Image.file(
                                controller.imgs!,
                                fit: BoxFit.cover,
                              ),
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Elevated(
                    width: Get.width,
                    onTap: () {
                      formKey.currentState!.save();

                      controller.feedbacks(widget.e.restaurant.id.toString(),
                          widget.e.id.toString());
                      if (widget.isComplete) {
                        controller.updateStatus(widget.e.id, OrderState.completed);
                      }
                    },
                    backgroundColor: (ratingText == '' ||
                            controller.feedback.text.isEmpty &&
                                controller.imgs?.path != null)
                        ? MyTheme.buttonColor
                        : MyTheme.buttonchangeColor,
                    text: 'Post Feedback',
                    borderColor: controller.feedback.text.isEmpty
                        ? MyTheme.buttontextColor
                        : MyTheme.buttontextchangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
