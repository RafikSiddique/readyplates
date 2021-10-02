



import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
          height: 300,
       
         width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
                  SizedBox(height: 20,),
                 // textField(),
                 otpField()

            ],
          ),

        ),

    );
  }

  Widget otpField() {
    return OTPTextField(
   
      length: 6,
      width: 250,
      
       //width: MediaQuery.of(context).size.width,
      fieldWidth: 30,
      otpFieldStyle: OtpFieldStyle(
       //backgroundColor: Color(0xff1d1d1d),
        borderColor: Colors.red,
        focusBorderColor: Color(0xff1d1d1d),
        
        
      ),
      style: TextStyle(fontSize: 17, color: Colors.red),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        print("Completed: " + pin);
        // setState(() {
        //   smsCode = pin;
        // });
      },
    );
  }

  // Widget textField()
  // {
  //   return Container(
  //     height: 30,
  //         //  width: MediaQuery.of(context).size.width,
  //         width: 30,
  //           decoration: 
  //           BoxDecoration(color: Colors.white,
  //           borderRadius: BorderRadius.circular(15),
            
  //   ),
  //   // child: TextFormField(decoration: InputDecoration(
  //   //   border: InputBorder.none,
  //   //   hintText: "enter number",
  //   //   hintStyle: TextStyle(fontSize: 17),
  //   // ),),
    
  //   );
  // }
}

    
  
  
  
