// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
import 'package:readyplates/modals/signup.dart';
// import 'dart:async';

import 'package:readyplates/utils/routes.dart';

//import 'package:readyplates/utils/routes.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _checkbox = false;
  //bool _checkboxListTile = false;
  String valueChoose = 'Male';
  final items = ['Male', 'Female'];
  String? value;

  String gender = "";

//final emailController = TextEditingController();
  final firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  //TextEditingController gender = TextEditingController();
  final dob = TextEditingController();
  final email = TextEditingController();
  // ignore: non_constant_identifier_names
  final mob_num = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  Signup? users;

  // Future<Signup?> registrationuser(
  //     String firstname,
  //     String lastname,
  //     String gender,
  //     String dob,
  //     String email,
  //     // ignore: non_constant_identifier_names
  //     String mob_num,
  //     String password,
  //     String password2) async {
  //   http.Response response;
  //   response = await http.post(
  //     Uri.parse('http://192.168.0.194:5000/accounts/register/'),
  //     body: jsonEncode(<String, String>{
  //       'firstname': firstname,
  //       'lastname': lastname,
  //       'gender': gender,
  //       'dob': dob,
  //       'email': email,
  //       'mob_num': mob_num,
  //       'password': password,
  //       'password2': password2,
  //     }),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 201) {
  //     print('object');
  //     //return Signup.fromJson(response.body);
  //   } else {
  //     throw Exception('Failed to create User.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 20),
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                    ),
                    color: Color(0xff393E46),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.OnbordingPage);
                    },
                  ),
                  SizedBox(width: 87),
                  Text("user Information",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff2F2E41),
                      )),
                ],
              ),
             Padding(
               padding: const EdgeInsets.only(left: 16),
               child: Text("Name",style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
             ),
             SizedBox(height: 5,),
              Container(
                height: 45,
                
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: firstname,
                  decoration: InputDecoration(


                    hintText: 'First Name',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                   // labelText: "First Name",
                    border: OutlineInputBorder( borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),),
                  ),
                ),
              ),
              Container(
                 height: 45,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: lastname,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder( borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),),
                  ),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child:
                    Text("Make sure it matches the name on your government ID",
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xff2F2E41),
                        )),
              ),
              SizedBox(height: 19),
              Padding(
               padding: const EdgeInsets.only(left: 16),
               child: Text("Gender",style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
             ),
              SizedBox(height: 5),
              Container(
                 height: 45,
                margin: EdgeInsets.only(left: 16, right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffE0E0E0), width: 2),
                ), //2F2E41, #E0E0E0,2F2E41

                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: valueChoose,
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xff000000),
                      ),
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() {
                            valueChoose = value.toString();
                            gender = valueChoose;
                          })),
                ),
              ),
              SizedBox(height: 19),
               Padding(
               padding: const EdgeInsets.only(left: 16),
               child: Text("Date of Birth",style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
             ),
              SizedBox(height: 5),
              Container(
                 height: 45,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: dob,
                  decoration: InputDecoration(

                      hintText: 'dd/mm/yyyy',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),),
                   // labelText: "dd/mm/yyyy",
                    border: OutlineInputBorder( borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),),
                  ),
                ),
              ),
              SizedBox(height: 19),
               Padding(
               padding: const EdgeInsets.only(left: 16),
               child: Text("Email ID",style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
             ),
              SizedBox(height: 5),
              Container(
                 height: 45,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(

                       hintText: 'rafiq.siddhiqi@fladdra.com',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),),
                    //labelText: "rafiq.siddhiqi@fladdra.com",
                    border: OutlineInputBorder( borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),),
                  ),
                ),
              ),
              SizedBox(height: 19),
               Padding(
               padding: const EdgeInsets.only(left: 16),
               child: Text("Mobile",style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
             ),
              SizedBox(height: 5),
              Container(
                 height: 45,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: mob_num,
                  decoration: InputDecoration(

                    hintText: '923944543',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),),
                    //labelText: "923944543",
                    border: OutlineInputBorder( borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),),
                  ),
                ),
              ),
              SizedBox(height: 19),
               Padding(
               padding: const EdgeInsets.only(left: 16),
               child: Text("Password",style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
             ),
              SizedBox(height: 5),
              Container(
                 height: 45,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: '********',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 17,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),),
                    
                    //labelText: "***********",
                    border: OutlineInputBorder( borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Password2",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff2F2E41),
                    )),
              ),
              Container(
                 height: 45,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: password2,
                  decoration: InputDecoration(
                       hintText: '********',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 17,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),),
                   //] labelText: "***********",
                    border: OutlineInputBorder( borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),),
                  ),
                ),
              ),
              SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Strong",
                    style: TextStyle(
                      fontSize: 9,
                      color: Color(0xff6E6D7A),
                    )),
              ),
              SizedBox(height: 19),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Checkbox(
                      value: _checkbox,
                      onChanged: (value) {
                        setState(() {
                          _checkbox = !_checkbox;
                        });
                      },
                    ),
                  ),
                  Text('I have a referral code',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff3C3B4D),
                      )),
                ],
              ),
              SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: SizedBox(
                  height: 45,
                   width: MediaQuery.of(context).size.width,
                   
                  //width: 343,
                  child: Padding(
                    padding: const EdgeInsets.only(left:16,right:16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //222831
                          primary: Color(0xff222831),
                          side: BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(255, 255, 255, 0.5)),
                        ),
                        onPressed: () async {
                          Navigator.pushNamed(context, MyRoutes.LoginPage);
                          // final String firstname1 = firstname.text;
                          // final String lastname1 = lastname.text;
                          // final String gender1 = gender;
                          // final String dob1 = dob.text;
                          // final String email1 = email.text;
                          // // ignore: non_constant_identifier_names
                          // final String mob_num1 = mob_num.text;
                          // final String password1 = password.text;
                          // final String password22 = password2.text;
                          // // final String password = passwordController.text;
                          // final Signup? user = await registrationuser(
                          //     firstname1,
                          //     lastname1,
                          //     gender1,
                          //     dob1,
                          //     email1,
                          //     mob_num1,
                          //     password1,
                          //     password22);
                          // setState(() {
                          //   users = user;
                          // });
                        },

                        /* onPressed: () {

                        registrationUser();
                       Navigator.pushNamed(context, MyRoutes.OnbordingPage);

                      },*/
                        child: Text('CONTINUE',
                            style: TextStyle(
                              fontSize: 17,
                            ))),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  indent: 20,
                  endIndent: 40,
                  thickness: 2,
                  color: Colors.black,
                )),
                Text(
                  "OR",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Expanded(
                    child: Divider(
                  indent: 40,
                  endIndent: 20,
                  thickness: 2,
                  color: Colors.black,
                )),
              ]),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 164,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(34, 40, 49, 0.2),
                        side: BorderSide(
                            width: 1.5,
                            color: Color.fromRGBO(255, 255, 255, 0.5)),
                      ),
                      onPressed: () {},
                      child: Wrap(
                        children: <Widget>[
                         Padding(
                                    padding: const EdgeInsets.only(
                                        top: 13, bottom: 14, right: 9),
                                    child: Container(
                                        height: 21,
                                        width: 20,
                                        child: Image.asset(
                                            "assets/images/google.png")),
                                  ),
                        
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text("Continue with google!",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 9)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 164,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(34, 40, 49, 0.2),
                        side: BorderSide(
                            width: 1.5,
                            color: Color.fromRGBO(255, 255, 255, 0.5)),
                      ),
                      onPressed: () {},
                      child: Wrap(
                        children: <Widget>[
                          Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, bottom: 14, right: 9),
                                      child: Container(
                                          height: 18,
                                          width: 10,
                                          child: Image.asset(
                                              "assets/images/facebook.png")),
                                    ),
                         
                         Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: Text("Continue with facebook!",
                                style:
                                    TextStyle(color: Color(0xff505056), fontSize: 9)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(color: Color(0xff2F2E41), fontSize: 15),
      ));
}
