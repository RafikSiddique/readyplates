import 'package:flutter/material.dart';
import 'package:readyplates/pages/otppage.dart';

class LoginotpScreen extends StatelessWidget {
  const LoginotpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ready.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 442,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      // color: Colors.white,
                      height: 370,
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

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 26,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 17),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.chevron_left,
                                  ),
                                  color: Color(0xff393E46),
                                  onPressed: () {
                                    // Navigator.pushNamed(
                                    //     context, MyRoutes.OnbordingPage);
                                  },
                                ),
                              ),
                              SizedBox(width: 131),
                              Text("Login",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff393E46),
                                  )),
                            ],
                          ),
                          SizedBox(height: 33),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text("Email address / Mobile Number",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff2F2E41),
                                )),
                          ),
                          SizedBox(height: 15),
                          Container(
                            //height: 45,
                            margin: EdgeInsets.only(left: 16, right: 16),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              //controller: emailController,
                              decoration: InputDecoration(
                                hintText: '9623944543',
                                contentPadding: EdgeInsets.only(
                                  left: 12,
                                  top: 12,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: -0.264706,
                                  color: Color(0xff2F2E41).withOpacity(0.7),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xffE0E0E0)),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width,
                              child: OtpPage()),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: SizedBox(
                              height: 54,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff979797),
                                  ),
                                  onPressed: () {
                                    //Navigator.pushNamed(context, MyRoutes.LoginPage);
                                  },
                                  child: Text('CONTINUE',
                                      style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 17,
                                      ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
