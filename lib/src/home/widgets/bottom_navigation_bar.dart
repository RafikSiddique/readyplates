import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/utils/my_color.dart';

class AppNavigationBar extends StatelessWidget {
  AppNavigationBar({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Obx(
      () => Container(
        height: 60,
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
          elevation: 25,
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
      ),
    );
  }
}
