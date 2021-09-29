// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

Signup signupFromJson(String str) => Signup.fromJson(json.decode(str));

String signupToJson(Signup data) => json.encode(data.toJson());

class Signup {
    Signup({
        required this.email,
        required this.password,
        required this.password2,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.dob,
        required this.mobNum,
    });

    String email;
    String password;
    String password2;
    String firstName;
    String lastName;
    String gender;
    String dob;
    String mobNum;

    factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        email: json["email"],
        password: json["password"],
        password2: json["password2"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        dob: json["dob"],
        mobNum: json["mob_num"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "password2": password2,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "dob": dob,
        "mob_num": mobNum,
    };
}
