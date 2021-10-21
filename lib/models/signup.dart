import 'dart:convert';

class Signup {
  //String user;
  String email;
  String password;
  String password2;
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  String last_name;
  String gender;
  String dob;
  // ignore: non_constant_identifier_names
  String mob_num;

  Signup({
    //required this.user,
    required this.email,
    required this.password,
    required this.password2,
    // ignore: non_constant_identifier_names
    required this.first_name,
    // ignore: non_constant_identifier_names
    required this.last_name,
    required this.gender,
    required this.dob,
    // ignore: non_constant_identifier_names
    required this.mob_num,

  });
  
  
  

  Signup copyWith({
    String? user,
    String? email,
    String? password,
    String? password2,
    // ignore: non_constant_identifier_names
    String? first_name,
    // ignore: non_constant_identifier_names
    String? last_name,
    String? gender,
    String? dob,
    // ignore: non_constant_identifier_names
    String? mob_num,
  }) {
    return Signup(
     // user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      password2: password2 ?? this.password2,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      mob_num: mob_num ?? this.mob_num,
    );
  }

  Map<String, dynamic> toMap() {
    return {
     // 'user': user,
      'email': email,
      'password': password,
      'password2': password2,
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'dob': dob,
      'mob_num': mob_num,
    };
  }

  factory Signup.fromMap(Map<String, dynamic> map) {
    return Signup(
     // user: map['user'],
      email: map['email'],
      password: map['password'],
      password2: map['password2'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      gender: map['gender'],
      dob: map['dob'],
      mob_num: map['mob_num'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Signup.fromJson(String source) => Signup.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Signup( email: $email, password: $password, password2: $password2, first_name: $first_name, last_name: $last_name, gender: $gender, dob: $dob, mob_num: $mob_num)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Signup &&
     
      other.email == email &&
      other.password == password &&
      other.password2 == password2 &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.gender == gender &&
      other.dob == dob &&
      other.mob_num == mob_num;
  }

  @override
  int get hashCode {
    return 
      email.hashCode ^
      password.hashCode ^
      password2.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      mob_num.hashCode;
  }
  }
