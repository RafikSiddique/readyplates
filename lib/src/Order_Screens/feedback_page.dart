import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/custom_button.dart';
import 'package:readyplates/widgets/form_field.dart';
import 'package:readyplates/widgets/text_widget.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FeedbackPage extends StatefulWidget {
  static const id = "/feedback";
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
 final controller = Get.find<OrderController>();
  File? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  var rating1 = 0.0;
  var rating2 = 0.0;
  var rating3 = 0.0;
  var rating4 = 0.0;

  @override
  Widget build(BuildContext context) {
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
                    rating: rating1,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    onRatingChanged: (value) {
                      setState(() {
                        rating1 = value;
                        value = value;
                      });
                    },
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text('Excellent',
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
                text: 'Rate the taste',
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(
                    rating: rating2,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    onRatingChanged: (value) {
                      setState(() {
                        rating2 = value;
                        value = value;
                      });
                    },
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text("Poor",
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
                    rating: rating3,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    onRatingChanged: (value) {
                      setState(() {
                        rating3 = value;
                        value = value;
                      });
                    },
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text("Good",
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
                    rating: rating4,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    onRatingChanged: (value) {
                      setState(() {
                        rating4 = value;
                        value = value;
                      });
                    },
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text("Average",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff6E6D7A))),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              AppFormField(
                hintText: 'Tell us more about your overall experience',
                fontFamily: "Inter-Regular",
                fontSize: 12,
                hintfontSize: 12,
                fontWeight: FontWeight.normal,
                controller: controller.feedback,
                line: 5, toptext: '',
              ),
              SizedBox(
                height: 17,
              ),
              InkWell(
                  onTap: () {
                    pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyTheme.containerColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 228,
                    width: MediaQuery.of(context).size.width,
                    child: image == null
                        ? Center(
                            child: InkWell(
                              onTap: () {
                                pickImage(ImageSource.gallery);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child:
                                        Image.asset('assets/images/camera.png'),
                                    //  image != null
                                    // ?
                                    //  Image.file(
                                    //     image!,
                                    //   )
                                    //     : Image.asset('assets/images/camera.png'),
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
                            ),
                          )
                        : Image.file(
                            image!,
                            fit: BoxFit.fill,
                          ),
                  )),
              SizedBox(
                height: 16,
              ),
              CustomButton(
                onTap: () {},
                buttonbackgroundColor: controller.feedback.text.isEmpty
                    ? MyTheme.buttonColor
                    : MyTheme.buttonchangeColor,
                text: 'Post Feedback',
                buttontextColor: controller.feedback.text.isEmpty
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
    );
  }
}