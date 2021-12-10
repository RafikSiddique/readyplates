import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/login/auth_controller.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/place_search.dart';
import 'package:uuid/uuid.dart';

class MapPage extends StatefulWidget {
  final bool isHome;
  final LatLng latLng;
  MapPage({required this.isHome, required this.latLng});
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final AuthController authController = Get.find();
  String googleApiKey = "AIzaSyDR2to-aBls8N4Wqa4xt3Et5vk2GkVF2Do";
  late GoogleGeocoding _geoCoding = GoogleGeocoding(googleApiKey);

  late LatLng latLng = widget.latLng;
  final homeController = Get.put(HomeController());
  Future<void> setAddress() async {
    GeocodingResponse? results = await _geoCoding.geocoding
        .getReverse(LatLon(latLng.latitude, latLng.longitude));
    if (results != null) {
      GeocodingResult res = results.results![0];
      String? currentAddress = res.formattedAddress;
      if (currentAddress == null) {
        final address = await geoCode.reverseGeocoding(
            latitude: latLng.latitude, longitude: latLng.longitude);
        authController.address.value = address.streetAddress.toString() +
            ", " +
            address.region.toString() +
            ", " +
            address.postal.toString();
      } else {
        authController.address.value = currentAddress;
      }

      if (widget.isHome) {
        await authController.setAddress(
            latLng.latitude, latLng.longitude, authController.address.value);
        homeController.getAddress();
      }
    } else {
      final address = await geoCode.reverseGeocoding(
          latitude: latLng.latitude, longitude: latLng.longitude);
      authController.address.value = address.streetAddress.toString() +
          ", " +
          address.region.toString() +
          ", " +
          address.postal.toString();
      if (widget.isHome) {
        await authController.setAddress(
            latLng.latitude, latLng.longitude, authController.address.value);
        homeController.getAddress();
      }
    }
  }

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
    var media = MediaQuery.of(context);
    var size = media.size;
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
                  setAddress();
                },
                onMapCreated: (controller) {
                  this.controller = controller;
                  completer.complete(this.controller);
                  setAddress();
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, media.viewPadding.top, 8, 8),
                child: Container(
                  height: 54,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: TypeAheadField<Suggestion>(
                      itemBuilder: (BuildContext context, itemData) {
                        return ListTile(
                          title: Text(itemData.description.toString()),
                        );
                      },
                      onSuggestionSelected: (Suggestion? suggestion) async {
                        final session = Uuid().v4();

                        Place place = await PlaceApiProvider(session)
                            .getPlaceDetailFromId(suggestion!.placeId);
                        controller?.animateCamera(CameraUpdate.newLatLng(
                            LatLng(place.lat!, place.lang!)));
                      },
                      suggestionsCallback: (String pattern) async {
                        final session = Uuid().v4();
                        return PlaceApiProvider(session)
                            .fetchSuggestions(pattern, 'en');
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        // textAlign: TextAlign.center,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Search Any Location",
                            contentPadding:
                                const EdgeInsets.only(top: 27, left: 10),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                      color: Color(0xff5D5E5F).withOpacity(0.2),
                      shape: BoxShape.circle),
                  // padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () async {
                      Position position = await Geolocator.getCurrentPosition();
                      latLng = LatLng(position.latitude, position.longitude);
                      controller?.animateCamera(CameraUpdate.newLatLng(latLng));
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(8),
                        child: Image.asset(Assets.locationset)),
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
                            Text("Hello ${authController.fNamController.text}!",
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: MyTheme.dividermiddletext,
                                )),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text("Confirm your Location",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: MyTheme.buttonbackgroundColor,
                                    )),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 16,
                                  height: 20.13,
                                  child: Icon(Icons.location_on),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("NEARBY",
                                style: GoogleFonts.inter(
                                  fontSize: 10,

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
                                      if (widget.isHome) {
                                        setAddress();
                                        homeController.onPageChange(0);
                                      }
                                      // Navigator.pushNamed(
                                      //     context, MyRoutes.OnbordingPage);borderchangeColor
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              // indent: 16,
                              //// endIndent: 16,
                              thickness: 2,
                              color: MyTheme.devidercolor,
                              //  color: Color(0xffD8D8D8),
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
                                  onPressed: () async {
                                    final c = Get.put(HomeController());
                                    Get.put(OrderController());
                                    await authController.setAddress(
                                        latLng.latitude,
                                        latLng.longitude,
                                        authController.address.value);
                                    c.getAddress();
                                    c.getRestaurants();
                                    authController.gotoHome();
                                  },
                                  child: Text('NEXT',
                                      style: GoogleFonts.inter(
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
