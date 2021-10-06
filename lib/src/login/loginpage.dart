// // import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:readyplates/modals/login.dart';
// import 'package:readyplates/utils/routes.dart';
// // import 'package:http/http.dart' as http;
// import 'dart:async';
// // import 'dart:io';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool changeButton = false;

//   final _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   ScrollController controller = ScrollController();
//   Login? users;

//   moveToHome(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         changeButton = true;
//       });
//       await Future.delayed(Duration(seconds: 1));
//       await Navigator.pushNamed(context, MyRoutes.ImagePage);
//       setState(() {
//         changeButton = false;
//       });
//     }
//   }

//   // Future<Login?> logincall(
//   //   String username,
//   //   String password,
//   // ) async {
//   //   http.Response response;
//   //   response = await http.post(
//   //     Uri.parse('http://192.168.0.194:5000/accounts/login/'),
//   //     body: jsonEncode(<String, String>{
//   //       "username": username,
//   //       "password": password,
//   //     }),
//   //     headers: <String, String>{
//   //       'Content-Type': 'application/json; charset=UTF-8',
//   //     },
//   //   );
//   //   if (response.statusCode == 201) {
//   //     print('object');
//   //     return loginFromJson(response.body);
//   //   } else {
//   //     throw Exception('Failed to create User.');
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       controller: controller,
//       scrollDirection: Axis.vertical,
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/ready.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           controller: controller,
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 312,
//                 // width: 400,
//               ),
//               Container(
//                 height: 560,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(36.0),
//                     topRight: Radius.circular(36.0),
//                     bottomLeft: Radius.zero,
//                     bottomRight: Radius.zero,
//                   ),
//                   border: Border.all(
//                     color: Color(0xff979797),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromRGBO(230, 230, 230, 0.547886),
//                       offset: Offset(0, 2),
//                       blurRadius: 4,
//                       spreadRadius: 0,
//                     ),
//                   ],
//                 ),
//                 // color: Colors.white,
//                 child: Form(
//                   // ignore: deprecated_member_use
//                   autovalidate: true,
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             icon: const Icon(
//                               Icons.arrow_left,
//                             ),
//                             color: Color(0xff393E46),
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                   context, MyRoutes.OnbordingPage);
//                             },
//                           ),
//                           SizedBox(width: 120),
//                           Text("Login",
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Color(0xff6E6D7A),
//                               )),
//                         ],
//                       ),
//                       SizedBox(height: 30),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 16),
//                         child: Text("Email address / Mobile Number",
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color(0xff2F2E41),
//                             )),
//                       ),
//                       SizedBox(height: 10),
//                       Container(
//                         margin: EdgeInsets.only(left: 16, right: 16),
//                         width: MediaQuery.of(context).size.width,
//                         child: TextFormField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             labelText: "Email",
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: MultiValidator(
//                             [
//                               RequiredValidator(errorText: "Required"),
//                               EmailValidator(errorText: "not valid"),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 16),
//                         child: Text("Password",
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color(0xff2F2E41),
//                             )),
//                       ),
//                       SizedBox(height: 10),
//                       Container(
//                         margin: EdgeInsets.only(left: 16, right: 16),
//                         width: MediaQuery.of(context).size.width,
//                         child: TextFormField(
//                            obscureText: true,
//                           controller: passwordController,
//                           decoration: InputDecoration(
                            
//                               labelText: "Password",
//                               border: OutlineInputBorder()),
//                           validator: MultiValidator([
//                             RequiredValidator(errorText: "Required"),
//                             MinLengthValidator(1,
//                                 errorText: "More than 6 Required"),
//                           ]),
//                         ),
//                       ),
//                       TextButton(
//                         style: TextButton.styleFrom(
//                           textStyle: const TextStyle(fontSize: 13),
//                         ),
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(9.0),
//                               child: const Text('Forget Password',
//                                   style: TextStyle(
//                                       color: Color(0xff32B768), fontSize: 13)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       SizedBox(
//                         height: 54,
//                         width: MediaQuery.of(context).size.width,
//                         // ignore: deprecated_member_use
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16, right: 16),
//                           // ignore: deprecated_member_use
//                           child: RaisedButton(
//                               onPressed: () async {
//                                 // final String username = emailController.text;
//                                 // final String password = passwordController.text;
//                                 // final Login? user =
//                                 //     await logincall(username, password);
//                                 // setState(() {
//                                 //   users = user;
//                                 // });
//                                 moveToHome(context);
//                               },
//                               child: Text(
//                                 "Login",
//                                 style: TextStyle(color: Colors.black),
//                               )),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       SizedBox(
//                         height: 54,
//                         width: MediaQuery.of(context).size.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16, right: 16),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: Color.fromRGBO(34, 40, 49, 0.2),
//                               side: BorderSide(
//                                   width: 1.5,
//                                   color: Color.fromRGBO(255, 255, 255, 0.5)),
//                             ),
//                             onPressed: () {},
//                             child: Wrap(
//                               children: <Widget>[
//                                 IconButton(
//                                     icon: FaIcon(FontAwesomeIcons.google),
//                                     onPressed: () {}),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(15),
//                                   child: Text("Continue with google!",
//                                       style: TextStyle(
//                                           color: Colors.black, fontSize: 13)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
