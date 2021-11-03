import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:readyplates_restaurants/utils/my_color.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final Color buttonbackgroundColor;
  final List<BoxShadow>? boxShadow;
  final FontWeight? fontWeight;
  final String text;
  final Color buttontextColor;
  const CustomButton(
      {Key? key,
      required this.onTap,
      this.fontWeight = FontWeight.w600,
      required this.buttonbackgroundColor,
      this.boxShadow,
      required this.text,
      required this.buttontextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,

        //  () async {
        //   formKey.currentState!.save();
        //   if (formKey.currentState!.validate())
        //     controller.onboardingApi(OnBoardingMethod.api1);
        // },
        child: Container(
          height: 40.11,
          decoration: BoxDecoration(
            color: buttonbackgroundColor,
            //  (
            //    controller.resNameController.text.isEmpty ||
            //         controller.firstNameController.text.isEmpty ||
            //         controller.lastNameController.text.isEmpty ||
            //         controller.ownemailController.text.isEmpty ||
            //         controller.ownMobileController.text.isEmpty ||
            //         controller.rescity.isEmpty ||
            //         controller.pocController.text.isEmpty ||
            //         controller.pocNumberController.text.isEmpty)
            //     ? MyTheme.buttonColor
            //     : MyTheme.buttonchangeColor,
            boxShadow: boxShadow,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Center(
            child: Text(
              text,
              // 'CONTINUE',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: fontWeight,
                fontStyle: FontStyle.normal,
                color: buttontextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}