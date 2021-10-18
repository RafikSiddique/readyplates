import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/home_controller.dart';

class AppNavigationBar extends StatelessWidget {
  AppNavigationBar({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff00ADB5),
        onTap: controller.onPageChange,
        items: [
          for (var i = 0; i < controller.bottomBarIcons.length; i++)
            BottomNavigationBarItem(
                icon: Image.asset(
                  controller.bottomBarIcons[i],
                  height: media.size.width / 18,
                  width: media.size.width / 18,
                  color: controller.currentIndex.value == i
                      ? Color(0xff00ADB5)
                      : null,
                ),
                label: controller.label[i])
        ],
      ),
    );
  }
}
