import 'dart:convert';

import 'package:flutter/foundation.dart';

class Restaurant {
  int id;
  String resName;
  dynamic address;
  List<Bio> bio;

  Restaurant({
    required this.id,
    required this.resName,
    required this.address,
    required this.bio,
  });

  Restaurant copyWith({
    int? id,
    String? resName,
    dynamic address,
    List<Bio>? bio,
  }) {
    return Restaurant(
      id: id ?? this.id,
      resName: resName ?? this.resName,
      address: address ?? this.address,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'resName': resName,
      'address': address,
      'bio': bio.map((x) => x.toMap()).toList(),
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      resName: map['resName'],
      address: map['address'],
      bio: List<Bio>.from(map['bio']?.map((x) => Bio.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Restaurant(id: $id, resName: $resName, address: $address, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Restaurant &&
        other.id == id &&
        other.resName == resName &&
        other.address == address &&
        listEquals(other.bio, bio);
  }

  @override
  int get hashCode {
    return id.hashCode ^ resName.hashCode ^ address.hashCode ^ bio.hashCode;
  }
}

class Bio {
  Bio({
    required this.servingTime,
    required this.food1,
  });

  String servingTime;
  String food1;

  toMap() {}

  static fromMap(x) {}
}
