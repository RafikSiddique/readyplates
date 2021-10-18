import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/src/home/home_controller.dart';

import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/widgets/edit_button.dart';

class ShopPage extends StatelessWidget {
  ShopPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Color(0xff000000),
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.MapPage);
            }),
        centerTitle: true,
        title: Text(
          'Sloppy Joe Burgers',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xff393E46),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: Color(0xff979797),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(230, 230, 230, 0.547886),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 16,
                        icon: FaIcon(
                          FontAwesomeIcons.search,
                          color: Color(0xff000000),
                        ),
                        onPressed: () {}),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xff393E46),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "MAIN COURSE",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff4E535A)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ...controller.foodItems
                  .map(
                    (e) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.all(7),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox.square(
                              dimension: size.width * 0.27,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/image1.png",
                                          // getUrl(e.image1),
                                          fit: BoxFit.cover,
                                          height: size.width * 0.22,
                                          width: size.width * 0.22,
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: EditButton(
                                          widthFraction: 0.18,
                                          onTap: () {
                                      /*       controller.isEditing = true;
                                            controller.foodItemModel = e; */
                                            // Get.toNamed(ShopPage.id);
                                          },
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: size.width * 0.25,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.05),
                                      ),
                                    ),
                                    Text(
                                      e.description,
                                      style: GoogleFonts.montserrat(
                                          fontSize: size.width * 0.03),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Image.asset((e.diet_type == "Veg"
                                            ? "assets/images/veg.png"
                                            : "assets/images/nonveg.png")),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ...List.generate(
                                          double.parse(e.spice_level).toInt(),
                                          (index) => Image.asset(
                                            'assets/images/spice.png',
                                            color: index == 0
                                                ? Color(0xff25A244)
                                                : null,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          e.cost,
                                          style: TextStyle(
                                            fontFamily: 'Inter-Bold',
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
