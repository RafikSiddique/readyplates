import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/utils/routes.dart';

class MapPage extends StatelessWidget {
  static const id = "/map";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        //alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height * 0.6,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  18.475036927423623,
                  73.89262582364269,
                ),
                zoom: 18,
              ),
              zoomControlsEnabled: true,
              mapType: MapType.terrain,
              markers: <Marker>[
                Marker(
                    markerId: MarkerId("1"),
                    position: LatLng(
                      18.475036927423623,
                      73.89262582364269,
                    ))
              ].toSet(),
            ),
          ),
          Container(
            height: size.height * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 300,
                  //width: 375,
                  width: MediaQuery.of(context).size.width,

                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 13),
                        child: Text("Hello Omar !",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              // color: Color(0xff4E535A),

                              color: Color.fromRGBO(78, 83, 90, 0.8),
                            )),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4, left: 16),
                            child: Text("Confirm your Location",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff222831),
                                )),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            width: 23,
                            height: 23,
                            child: Image.asset('assets/images/gps.png'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 13),
                        child: Text("NEARBY",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              // color: Color(0xff4E535A),
                              color: Color.fromRGBO(78, 83, 90, 0.8),
                              letterSpacing: 1,
                            )),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 31,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 16),
                              child: Text("Talab Masjid Kondhwa budruk",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.264706,
                                    color: Color(0xff393E46),
                                  )),
                            ),
                            IconButton(
                              icon: const Icon(Icons.done),
                              color: Color(0xff300ADB5),
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, MyRoutes.OnbordingPage);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: const Text('Change Location',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.1,
                                      color: Color(0xff00ADB5),
                                      fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: SizedBox(
                          height: 54,
                          width: MediaQuery.of(context).size.width,
                          //width: 343,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                side: BorderSide(
                                    width: 1.5,
                                    color: Color.fromRGBO(255, 255, 255, 0.5)),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.shopRoute);
                              },
                              child: Text('NEXT',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.1,
                                    color: Color(0xffFFFFFF),
                                    fontSize: 17,
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
