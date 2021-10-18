import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readyplates/utils/my_color.dart';

// ignore: must_be_immutable
class AppFormField extends StatelessWidget {
  final int? line;
  final Widget? suffixIcon;
  final bool isRequired;
  final String toptext;
  final String? Function(String?)? validator;
  final String hintText;
  final BorderRadius borderRadius;
  final TextEditingController controller;
  final String? bottomText;
  final bool isPassword;
  final List<TextInputFormatter>? formatters;
  final TextInputType inputType;
  final double fontSize;
  final double hintfontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final bool matchVerification;
  final FocusNode? focusNode;
  final TextEditingController? secondVal;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function()? onEditingCompleted;
  AppFormField({
    Key? key,
    this.suffixIcon,
    this.onEditingCompleted,
    this.onFieldSubmitted,
    this.focusNode,
    this.onSaved,
    this.line,
    this.secondVal,
    this.matchVerification = false,
    this.isRequired = true,
    this.fontSize = 13,
    this.hintfontSize = 12,
    this.fontFamily = 'Inter-Bold',
    this.fontWeight = FontWeight.w500,
    required this.toptext,
    this.inputType = TextInputType.text,
    this.formatters,
    required this.hintText,
    this.isPassword = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.validator,
    required this.controller,
    this.bottomText,
  })  : assert(matchVerification ? secondVal != null : true),
        super(key: key);

  bool obSecureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (toptext != "") Text(toptext),
          if (toptext != "")
            SizedBox(
              height: 5,
            ),
          StatefulBuilder(builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: MyTheme.borderColor,
                  // color: controller.text != ""
                  //     ? MyTheme.borderchangeColor
                  //     : MyTheme.borderColor,
                ),
                borderRadius: borderRadius,
              ),
              child: TextFormField(
                maxLines: line,
                onEditingComplete: onEditingCompleted,
                onFieldSubmitted: onFieldSubmitted,
                onSaved: onSaved,
                obscureText: isPassword ? obSecureText : false,
                inputFormatters: formatters,
                focusNode: focusNode,
                controller: controller,
                validator: (value) {
                  if (value == "") {
                    if (isRequired) {
                      return "This Field is required";
                    }
                  } else {
                    if (matchVerification) {
                      if (value != secondVal!.text) {
                        return "The $toptext does not match";
                      }
                    }
                  }
                  if (validator != null) return validator!(value);
                },
                textAlign: TextAlign.left,
                keyboardType: inputType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: borderRadius,
                  ),
                  hintText: hintText,
                  contentPadding: EdgeInsets.only(
                    left: 14,
                    top: 14,
                    right: 14,
                    bottom: 14,
                  ),
                  suffixIcon: suffixIcon,
                  hintStyle: TextStyle(
                    fontSize: hintfontSize,
                    fontFamily: 'Inter-Regular',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.26,
                    color: MyTheme.hinttextColor,
                    // // color: controller.text != ''
                    //     ? MyTheme.hinttextchangeColor
                    //     : MyTheme.hinttextColor,
                  ),
                ),
              ),
            );
          }),
          if (bottomText != null)
            SizedBox(
              height: 3,
            ),
          if (bottomText != null)
            Text(
              bottomText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                color: MyTheme.bottomtextColor,
              ),
            ),
        ],
      ),
    );
  }
}
