import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/my_color.dart';

// ignore: must_be_immutable
class AppFormField extends StatefulWidget {
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
    this.hintfontSize = 15,
    this.fontFamily = 'Inter-Regular',
    this.fontWeight = FontWeight.w500,
    required this.toptext,
    this.inputType = TextInputType.text,
    this.formatters,
    required this.hintText,
    this.isPassword = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.validator,
    required TextEditingController controller,
    this.bottomText,
  })  : assert(matchVerification ? secondVal != null : true),
        this.controller = controller,
        super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  bool obSecureText = true;
  TextEditingController get controller => widget.controller;

  bool validateStructure(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.toptext != "")
            Text(
              widget.toptext,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: MyTheme.hinttextchangeColors),
            ),
          if (widget.toptext != "")
            SizedBox(
              height: 5,
            ),
          ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, v, __) {
                return Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 1,
                  //     // color: MyTheme.borderColor,
                  //     color: widget.controller.text != ""
                  //         ? MyTheme.borderchangeColor
                  //         : MyTheme.borderColor,
                  //   ),
                  //   borderRadius: widget.borderRadius,
                  // ),
                  child: TextFormField(
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: MyTheme.hinttextchangeColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: widget.line,
                    onEditingComplete: widget.onEditingCompleted,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    onSaved: widget.onSaved,
                    obscureText: widget.isPassword ? obSecureText : false,
                    inputFormatters: widget.formatters,
                    focusNode: widget.focusNode,
                    controller: widget.controller,
                    validator: (value) {
                      if (value == "") {
                        if (widget.isRequired) {
                          return "This Field is required";
                        }
                      }
                      if (widget.isPassword) {
                        if (!validateStructure(value!)) {
                          return 'Password should contains atleast 8 characters \n(Caps, Small & Special Characters)';
                        }
                      }
                      if (widget.matchVerification) {
                        if (value != widget.secondVal!.text) {
                          return "The ${widget.toptext} does not match";
                        }
                      }

                      if (widget.validator != null)
                        return widget.validator!(value);
                    },
                    textAlign: TextAlign.left,
                    keyboardType: widget.inputType,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          height: 1,
                          textBaseline: TextBaseline.ideographic,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: v.text != ""
                                ? MyTheme.borderchangeColor
                                : MyTheme.borderColor,
                          ),
                          borderRadius: widget.borderRadius,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: v.text != ""
                                ? MyTheme.borderchangeColor
                                : MyTheme.borderColor,
                          ),
                          borderRadius: widget.borderRadius,
                        ),
                        counterText: "",
                        hintText: widget.hintText,
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 5,
                          right: 14,
                          bottom: 14,
                        ),
                        // suffixIcon: suffixIcon,
                        suffixIcon: widget.isPassword
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    obSecureText = !obSecureText;
                                  });
                                },
                                icon: Icon(obSecureText
                                    ? Icons.lock
                                    : Icons.lock_open))
                            : widget.suffixIcon,
                        hintStyle: GoogleFonts.inter(
                          fontSize: widget.hintfontSize,
                          //  fontFamily: 'Inter-Regular',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          //letterSpacing: -0.26,
                          color: MyTheme.hinttextColor,
                        )

                        // TextStyle(

                        //   // // color: controller.text != ''
                        //   //     ? MyTheme.hinttextchangeColor
                        //   //     : MyTheme.hinttextColor,
                        // ),
                        ),
                  ),
                );
              }),
          if (widget.bottomText != null)
            SizedBox(
              height: 3,
            ),
          if (widget.bottomText != null)
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(widget.bottomText!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    // fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    color: MyTheme.bottomtextColor,
                  )),
            ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class AppFormFields extends StatelessWidget {
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
  AppFormFields({
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
    this.hintfontSize = 15,
    this.fontFamily = 'Inter-Regular',
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
          if (toptext != "")
            Text(
              toptext,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: MyTheme.hinttextchangeColors),
            ),
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
                    // suffixIcon: suffixIcon,
                    suffixIcon: isPassword
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                obSecureText = !obSecureText;
                              });
                            },
                            icon: Icon(
                                obSecureText ? Icons.lock : Icons.lock_open))
                        : null,
                    hintStyle: GoogleFonts.inter(
                        fontSize: hintfontSize,
                        // decoration: ,

                        //  fontFamily: 'Inter-Regular',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        //letterSpacing: -0.26,
                        color: MyTheme.hinttextColor //Color(0xffB7B7B7),
                        )

                    // TextStyle(

                    //   // // color: controller.text != ''
                    //   //     ? MyTheme.hinttextchangeColor
                    //   //     : MyTheme.hinttextColor,
                    // ),
                    ),
              ),
            );
          }),
          if (bottomText != null)
            SizedBox(
              height: 3,
            ),
          if (bottomText != null)
            Text(bottomText!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 9,
                  // fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  color: MyTheme.bottomtextColor,
                )),
        ],
      ),
    );
  }
}
