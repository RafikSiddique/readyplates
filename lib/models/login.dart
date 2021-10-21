// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
// class Login {
//   String username;
//   String password;

//   Login({
//     required this.username,
//     required this.password,
//   });

//   Login copyWith({
//     String? username,
//     String? password,
//   }) {
//     return Login(
//       username: username ?? this.username,
//       password: password ?? this.password,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'username': username,
//       'password': password,
//     };
//   }

//   factory Login.fromMap(Map<String, dynamic> map) {
//     return Login(
//       username: map['username'],
//       password: map['password'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Login.fromJson(String source) => Login.fromMap(json.decode(source));

//   @override
//   String toString() => 'Login(username: $username, password: $password)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Login &&
//         other.username == username &&
//         other.password == password;
//   }

//   @override
//   int get hashCode => username.hashCode ^ password.hashCode;
// }
