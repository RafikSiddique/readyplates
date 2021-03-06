import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/utils/my_color.dart';

class AppNavigationBar extends StatelessWidget {
  AppNavigationBar({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Platform.isIOS ? 90 : 60,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.25),
              blurRadius: 4,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: MyTheme.appbackgroundColor,
          selectedItemColor: MyTheme.orangeColor,
          unselectedItemColor: MyTheme.appbartextColor,
          elevation: 25,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: controller.onPageChanged,
          items: [
            for (var i = 0; i < controller.bottomBarIcons.length; i++)
              BottomNavigationBarItem(
                  icon: Image.asset(
                    controller.bottomBarIcons[i],
                    height: 20,
                    width: 20,
                    color: controller.currentIndex.value == i
                        ? MyTheme.orangeColor
                        : MyTheme.appbartextColor,
                  ),
                  label: controller.label[i])
          ],
        ),
      ),
    );
  }
}
