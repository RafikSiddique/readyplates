// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

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
      Get.dialog(
        AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox.square(
            dimension: Get.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                    dimension: 100,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          MyTheme.borderchangeColor),
                    )),
                Text("Uplaoding Image")
              ],
            ),
          ),
        ),
      );
      await Get.find<AuthController>().uploadImage(imageTemporary);
    } on PlatformException catch (e) {
      print('object: $e');
    }
  }

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text('Add Profile Pic',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                letterSpacing: -0.226667,
                color: MyTheme.appbartextColor,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  : Image.asset(Assets.imageMan),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                    (authController.fNamController.text +
                            " " +
                            authController.lNameController.text)
                        .toUpperCase(),
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.skiptextcolor,
                    )),
              ),
            ),
            SizedBox(
              height: 84,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Elevated(
                  //  width: media.size.width / 1.3,
                  width: MediaQuery.of(context).size.width,
                  text: "Open Camera",
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: MyTheme.buttonbackgroundColor,
                  onTap: () => pickImage(ImageSource.camera),
                  borderColor: MyTheme.buttonbackgroundColor,
                  backgroundColor: Colors.white),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Elevated(
                // width: media.size.width / 1.3,
                width: MediaQuery.of(context).size.width,
                text: "Upload from gallery", fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 17, //color: Colors.white,
                onTap: () async {
                  await pickImage(ImageSource.gallery);
                },
              ),
            ),
            SizedBox(
              height: media.size.height * 0.12,
            ),
            InkWell(
              onTap: () async {
                bool isLocationEnabled = await authController.getPermission();
                if (isLocationEnabled) {
                  Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: SizedBox.square(
                        dimension: Get.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox.square(
                                dimension: 100,
                                child: CircularProgressIndicator.adaptive(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      MyTheme.borderchangeColor),
                                )),
                            Text("Loading...")
                          ],
                        ),
                      ),
                    ),
                  );
                  Position position = await Geolocator.getCurrentPosition();
                  LatLng latLng = LatLng(position.latitude, position.longitude);

                  Get.to(() => MapPage(
                        isHome: false,
                        latLng: latLng,
                      ));
                } else {
                  LatLng latLng =
                      LatLng(20.708391858928152, -156.32455678019107);

                  Get.to(() => MapPage(
                        isHome: false,
                        latLng: latLng,
                      ));
                }
              },
              child: Material(
                type: MaterialType.transparency,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Skip for Now",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: MyTheme.skiptextcolor,
                        )),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    IconButton(
                        iconSize: 12.83,
                        icon: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: Colors.black,
                        ),
                        onPressed: null),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
