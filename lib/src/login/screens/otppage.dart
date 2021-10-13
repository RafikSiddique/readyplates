import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFFFFFF),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // textField(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                  height: 45,
                  //width: MediaQuery.of(context).size.width,
                  child: otpField()),
            )
          ],
        ),
      ),
    );
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: 310,

      // width: MediaQuery.of(context).size.width,
      fieldWidth: 45,

      otpFieldStyle: OtpFieldStyle(
        //backgroundColor: Color(0xff1d1d1d),

        borderColor: Color(0xffFF7976),

        focusBorderColor: Color(0xffFF7976),
      ),
      style: TextStyle(fontSize: 17, color: Color(0xffFF7976)),
      textFieldAlignment: MainAxisAlignment.spaceAround,

      fieldStyle: FieldStyle.box,

      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }
}
