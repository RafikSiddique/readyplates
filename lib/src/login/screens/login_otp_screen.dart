import 'package:flutter/material.dart';
import 'package:readyplates/src/login/screens/otppage.dart';

import 'package:readyplates/utils/routes.dart';

class LoginotpScreen extends StatefulWidget {
  const LoginotpScreen({Key? key}) : super(key: key);

  @override
  _LoginotpScreenState createState() => _LoginotpScreenState();
}

class _LoginotpScreenState extends State<LoginotpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Widget titleText(String text) {
    return Text(text,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xff374151),
        ));
  }

  bool isScrollOpen = false;
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      //controller: controller,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: isScrollOpen ? size.height * 0.5 : size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ready.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36.0),
                  topRight: Radius.circular(36.0),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                border: Border.all(
                  color: Color(0xff979797),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(230, 230, 230, 0.547886),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                            ),
                            color: Color(0xff393E46),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.OnbordingPage);
                            },
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Text("Login",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Color(0xff6E6D7A),
                              )),
                          Spacer(
                            flex: 3,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      //SizedBox(height: size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: titleText(
                          "Email address / Mobile Number",
                        ),
                      ),
                      SizedBox(height: size.height * 0.010),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          // obscureText: true,
                          //controller: password,
                          decoration: InputDecoration(
                            hintText: '+919623944543',
                            contentPadding: EdgeInsets.only(
                              left: 14,
                              top: 17,
                              //bottom: 12,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Monstserrat',
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              letterSpacing: -0.264706,
                              color: Color(0xff222831).withOpacity(0.7),
                            ),

                            //labelText: "***********",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xffBEC5D1)),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                          height: 80,
                          color: Color(0xffFFFFFF),
                          width: MediaQuery.of(context).size.width,
                          child: OtpPage()),
                      //SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Incorrect OTP",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffFF7976),
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff979797),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.ImagePage);
                            },
                            child: Text('CONTINUE',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
