import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:readyplates/src/home/widgets/profile_tile.dart';
import 'package:readyplates/utils/my_color.dart';
//import 'package:readyplates/widgets/edit_button.dart';

class ProfilePage extends StatelessWidget {
  static const id = "/profile";
  const ProfilePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
          backgroundColor: Color(0xffF5F5F5),
          elevation: 0,
          centerTitle: true,
          title: Text('Profile',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 17,
                letterSpacing: -0.226667,
                color: MyTheme.appbartextColor,
              )),
        ),
        body: Column(
          children: [
            ProfileListTile(title: "Change Password", onTap: () {}),
            ProfileListTile(title: "User Credential", onTap: () {}),
            //ProfileListTile(title: "Logout", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
