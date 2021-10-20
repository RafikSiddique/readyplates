// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  static const id = "/image";
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() => this.image = imageTemporary);
      Get.find<AuthController>().uploadImage(imageTemporary);
    } on PlatformException catch (e) {
      print('object: $e');
    }
  }

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Color(0xffFFFFFF),
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Color(0xff000000),
              ),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            'Add Profile Pic',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 17,
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // color: Color(0xffE5E5E5),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(height: 92),

                  Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(230)),
                        // color: Colors.black,
                      ),
                      child: image != null
                          ? ClipOval(
                              child: Image.file(image!,
                                  height: 160, width: 160, fit: BoxFit.cover))
                          : Image.asset("assets/images/imageman.png")),

                  // Center(
                  //   child: Container(
                  //     width: 235,
                  //     height: 200,
                  //     child: Image.asset("assets/images/imageman.png"),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Center(
                      child: Text(
                          (authController.fNamController.text +
                                  " " +
                                  authController.lNameController.text)
                              .toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Color(
                              0xff4E5156,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: 84),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      border: Border.all(
                        width: 1,
                        color: Color(0xff222831),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    //  margin: EdgeInsets.only(left: 16, right: 16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(
                            0xffFFFFFF,
                          ),
                        ),
                        onPressed: () => pickImage(ImageSource.camera),

                        // {
                        //   //Navigator.pushNamed(context, MyRoutes.SignupPage);
                        // },
                        child: Text('Open Camera',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Inter-Regular',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Color(
                                0xff222831,
                              ),
                            ))),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      border: Border.all(
                        width: 1,
                        color: Color(0xff222831),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.only(left: 16, right: 16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () => pickImage(ImageSource.gallery),
                        child: Text('Upload from Gallery',
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Color(
                                0xffFFFFFF,
                              ),
                              fontSize: 17,
                            ))),
                  ),
                  SizedBox(
                    height: 63,
                  ),
                  InkWell(
                    onTap: () async {
                      bool isLocationEnabled =
                          await Geolocator.isLocationServiceEnabled();
                      if (isLocationEnabled) {
                        LocationPermission permission =
                            await Geolocator.requestPermission();

                        if (permission == LocationPermission.denied ||
                            permission == LocationPermission.deniedForever) {
                          await Geolocator.openAppSettings();
                        } else {
                          Position position =
                              await Geolocator.getCurrentPosition();
                          Get.toNamed(MapPage.id);
                        }
                      } else {
                        await Geolocator.openLocationSettings();
                      }
                    },
                    child: Material(
                      type: MaterialType.transparency,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Skip for Now",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff4E5156),
                              )),
                          IconButton(
                              iconSize: 14.83,
                              icon: FaIcon(
                                FontAwesomeIcons.chevronRight,
                                color: Color(0xff000000),
                              ),
                              onPressed: null),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
