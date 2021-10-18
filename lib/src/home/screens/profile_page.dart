import 'package:flutter/material.dart';

import 'package:readyplates/src/home/widgets/profile_tile.dart';
//import 'package:readyplates/widgets/edit_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            letterSpacing: -0.226667,
            color: Color(0xff393E46),
          ),
        ),
      ),
      body: Column(
        children: [
          ProfileListTile(title: "Change Password", onTap: () {}),
          ProfileListTile(title: "User Credential", onTap: () {}),
        ],
      ),
    );
  }
}
