import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/routes.dart';

class MapPage extends StatefulWidget {
  static const id = "/map";
  final bool isHome;
  MapPage({required this.isHome});
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final AuthController authController = Get.find();

  late LatLng latLng = LatLng(
    18.475036927423623,
    73.89262582364269,
  );

  Widget pin() {
    return IgnorePointer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.place, size: 56),
            Container(
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black38,
                  ),
                ],
                shape: CircleBorder(
                  side: BorderSide(
                    width: 4,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(height: 56),
          ],
        ),
      ),
    );
  }

  GoogleMapController? controller;

  Completer<GoogleMapController> completer = Completer<GoogleMapController>();
  GeoCode geoCode = GeoCode();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: latLng,
                  zoom: 18,
                ),
                onCameraIdle: () async {
                  final address = await geoCode.reverseGeocoding(
                      latitude: latLng.latitude, longitude: latLng.longitude);
                  authController.address.value =
                      address.streetAddress.toString() +
                          ", " +
                          address.region.toString() +
                          ", " +
                          address.postal.toString();
                },
                onMapCreated: (controller) {
                  this.controller = controller;
                  completer.complete(this.controller);
                },
                onCameraMove: (position) {
                  latLng = position.target;
                },
                zoomControlsEnabled: true,
                mapType: MapType.terrain,
              ),
              pin(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Material(
                type: MaterialType.transparency,
                shape: CircleBorder(),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyTheme.mapboxdecorationcolor,
                      //color: Color(0xff5D5E5F).withOpacity(0.2),
                      shape: BoxShape.circle),
                  // padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () async {
                      Position position = await Geolocator.getCurrentPosition();
                      latLng = LatLng(position.latitude, position.longitude);
                      controller!.animateCamera(CameraUpdate.newLatLng(latLng));
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(8),
                        child: Image.asset('assets/images/Locationset.png')),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 13,
                            ),
                            Text(
                                "Hello Omar ${authController.fNamController.text}!",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: MyTheme.dividermiddletext,
                                  // color: Color(0xff4E535A),dividermiddletext

                                  //color: Color.fromRGBO(78, 83, 90, 0.8),
                                )),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text("Confirm your Location",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: MyTheme.buttonbackgroundColor,
                                      //color: Color(0xff222831),
                                    )),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 16,
                                  height: 20.13,
                                  child: Image.asset('assets/images/gps.png'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("NEARBY",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.dividermiddletext,
                                  // color: Color(0xff4E535A),appbartextColor,dividermiddletext
                                  //color: Color.fromRGBO(78, 83, 90, 0.8),
                                  letterSpacing: 1,
                                )),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Obx(
                                        () => Text(authController.address.value,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                              letterSpacing: -0.264706,
                                              color: MyTheme.appbartextColor,
                                            ))),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.done),
                                    color: MyTheme.borderchangeColor,
                                    onPressed: () {
                                      // Navigator.pushNamed(
                                      //     context, MyRoutes.OnbordingPage);borderchangeColor
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (!widget.isHome)
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    minimumSize: Size(size.width, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  onPressed: () {
                                    authController.gotoHome();
                                  },
                                  child: Text('NEXT',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -0.1,
                                        color: Colors.white,
                                        fontSize: 17,
                                      ))),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
