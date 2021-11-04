import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class AddButton extends StatelessWidget {
  final double widthFraction;
  final void Function() onTap;
  final String text;
  const AddButton(
      {Key? key,
      required this.onTap,
      this.widthFraction = 0.2,
      this.text = "Add"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * widthFraction,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.add,
                  height: 16,
                  width: 16,
                ),
                Text(text.toUpperCase(),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      // fontFamily: 'Inter',
                      color: MyTheme.editbuttontextColor,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IncDecButton extends StatelessWidget {
  final RxInt text;
  final double widthFraction;
  final Function() onIncrement;
  final Function() onDecrement;
  IncDecButton(
      {Key? key,
      required this.text,
      required this.widthFraction,
      required this.onIncrement,
      required this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * widthFraction,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                onDecrement();
              },
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(6)),
                  side: BorderSide(
                    color: MyTheme.editbuttontextColor,
                  ),
                ),
                color: MyTheme.addremovebuttoncolor, //Color(0xffFDDEDE),
                child: Icon(
                  Icons.remove,
                  color: MyTheme.editbuttontextColor,
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Obx(
                () => Text(text.value.toString(),
                    key: ValueKey(text),
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      //fontFamily: 'Inter',
                      color: MyTheme.editbuttontextColor,
                    )),
              ),
              key: ValueKey(text),
            ),
            InkWell(
              onTap: () {
                onIncrement();
              },
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(6)),
                  side: BorderSide(
                    color: MyTheme.editbuttontextColor,
                  ),
                ),
                color: MyTheme.addremovebuttoncolor, //Color(0xffFDDEDE),
                child: Icon(
                  Icons.add,
                  color: MyTheme.editbuttontextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  final double widthFraction;
  final void Function() onTap;
  final Color? color;
  final String? text;
  final IconData? icon;
  const EditButton(
      {Key? key,
      required this.onTap,
      this.widthFraction = 0.2,
      this.text,
      this.icon,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * widthFraction,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        // color: Color(0xffFFF0F3),
        color: MyTheme.appbackcolor, //Colors.white, //appbackcolor,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon == null)
                  Image.asset(Assets.edit,
                      height: 16,
                      width: 16,
                      color: color ?? MyTheme.bottomtextColor)
                else
                  Icon(
                    icon,
                    color: color ?? MyTheme.bottomtextColor,
                    size: 14,
                  ),
                Text(text?.toUpperCase() ?? 'EDIT',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        // fontFamily: 'Inter',
                        //color: Color(0xffFF6E42),
                        color: color ?? MyTheme.bottomtextColor))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
