import 'dart:convert';

import 'package:flutter/foundation.dart';

class RestaurantModel {
  final int id;
  final String resName;
  final String? address;
  final List<Bio> bio;
  RestaurantModel({
    required this.id,
    required this.resName,
    required this.address,
    required this.bio,
  });

  RestaurantModel copyWith({
    int? id,
    String? resName,
    String? address,
    List<Bio>? bio,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      resName: resName ?? this.resName,
      address: address ?? this.address,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'res_name': resName,
      'address': address,
      'bio': bio.map((x) => x.toMap()).toList(),
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id']?.toInt(),
      resName: map['res_name'],
      address: map['address'],
      bio: map['bio'].length == 0
          ? [Bio(servingTime: "", food1: "")]
          : List<Bio>.from(map['bio']?.map((x) => Bio.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantModel(id: $id, res_name: $resName, address: $address, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantModel &&
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
  final String servingTime;
  final String food1;
  Bio({
    required this.servingTime,
    required this.food1,
  });

  Bio copyWith({
    String? servingTime,
    String? food1,
  }) {
    return Bio(
      servingTime: servingTime ?? this.servingTime,
      food1: food1 ?? this.food1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serving_time': servingTime,
      'food1': food1,
    };
  }

  factory Bio.fromMap(Map<String, dynamic> map) {
    return Bio(
      servingTime: map['serving_time'],
      food1: map['food1'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Bio.fromJson(String source) => Bio.fromMap(json.decode(source));

  @override
  String toString() => 'Bio(serving_time: $servingTime, food1: $food1)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bio &&
        other.servingTime == servingTime &&
        other.food1 == food1;
  }

  @override
  int get hashCode => servingTime.hashCode ^ food1.hashCode;
}
