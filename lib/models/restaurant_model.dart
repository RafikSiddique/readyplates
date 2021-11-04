import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'bio.dart';

class RestaurantModel {
  final int id;
  final List<Bio> bio;
  final String resName;
  final String own_name;
  final String own_mobile;
  final String res_city;
  final String poc;
  final String poc_number;
  final String address;
  final String postal_code;
  final String latitude;
  final String longitude;
  final String gstin_present;
  final String gstin_num;
  final String fssai_status;
  final String fssai_expiry;
  final String kyc_image;
  final String gstin_image;
  final String fssai_image;
  final String type_of_estd;
  final String types_of_cusine;
  final String start_time;
  final String end_time;
  final String open_days;
  final int completed_till;
  final int user;
  RestaurantModel({
    required this.id,
    required this.bio,
    required this.resName,
    required this.own_name,
    required this.own_mobile,
    required this.res_city,
    required this.poc,
    required this.poc_number,
    required this.address,
    required this.postal_code,
    required this.latitude,
    required this.longitude,
    required this.gstin_present,
    required this.gstin_num,
    required this.fssai_status,
    required this.fssai_expiry,
    required this.kyc_image,
    required this.gstin_image,
    required this.fssai_image,
    required this.type_of_estd,
    required this.types_of_cusine,
    required this.start_time,
    required this.end_time,
    required this.open_days,
    required this.completed_till,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bio': bio.map((x) => x.toMap()).toList(),
      'res_name': resName,
      'own_name': own_name,
      'own_mobile': own_mobile,
      'res_city': res_city,
      'poc': poc,
      'poc_number': poc_number,
      'address': address,
      'postal_code': postal_code,
      'latitude': latitude,
      'longitude': longitude,
      'gstin_present': gstin_present,
      'gstin_num': gstin_num,
      'fssai_status': fssai_status,
      'fssai_expiry': fssai_expiry,
      'kyc_image': kyc_image,
      'gstin_image': gstin_image,
      'fssai_image': fssai_image,
      'type_of_estd': type_of_estd,
      'types_of_cusine': types_of_cusine,
      'start_time': start_time,
      'end_time': end_time,
      'open_days': open_days,
      'completed_till': completed_till,
      'user': user,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id']?.toInt(),
      bio: List<Bio>.from(map['bio']?.map((x) => Bio.fromMap(x))),
      resName: map['res_name'] ?? "",
      own_name: map['own_name'] ?? "",
      own_mobile: map['own_mobile'] ?? "",
      res_city: map['res_city'] ?? "",
      poc: map['poc'] ?? "",
      poc_number: map['poc_number'] ?? "",
      address: map['address'] ?? "",
      postal_code: map['postal_code'] ?? "",
      latitude: map['latitude'] ?? "",
      longitude: map['longitude'] ?? "",
      gstin_present: map['gstin_present'] ?? "",
      gstin_num: map['gstin_num'] ?? "",
      fssai_status: map['fssai_status'] ?? "",
      fssai_expiry: map['fssai_expiry'] ?? "",
      kyc_image: map['kyc_image'] ?? "",
      gstin_image: map['gstin_image'] ?? "",
      fssai_image: map['fssai_image'] ?? "",
      type_of_estd: map['type_of_estd'] ?? "",
      types_of_cusine: map['types_of_cusine'] ?? "",
      start_time: map['start_time'] ?? "",
      end_time: map['end_time'] ?? "",
      open_days: map['open_days'] ?? "",
      completed_till: map['completed_till']?.toInt(),
      user: map['user']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantModel(id: $id, bio: $bio, res_name: $resName, own_name: $own_name, own_mobile: $own_mobile, res_city: $res_city, poc: $poc, poc_number: $poc_number, address: $address, postal_code: $postal_code, latitude: $latitude, longitude: $longitude, gstin_present: $gstin_present, gstin_num: $gstin_num, fssai_status: $fssai_status, fssai_expiry: $fssai_expiry, kyc_image: $kyc_image, gstin_image: $gstin_image, fssai_image: $fssai_image, type_of_estd: $type_of_estd, types_of_cusine: $types_of_cusine, start_time: $start_time, end_time: $end_time, open_days: $open_days, completed_till: $completed_till, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantModel &&
        other.id == id &&
        listEquals(other.bio, bio) &&
        other.resName == resName &&
        other.own_name == own_name &&
        other.own_mobile == own_mobile &&
        other.res_city == res_city &&
        other.poc == poc &&
        other.poc_number == poc_number &&
        other.address == address &&
        other.postal_code == postal_code &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.gstin_present == gstin_present &&
        other.gstin_num == gstin_num &&
        other.fssai_status == fssai_status &&
        other.fssai_expiry == fssai_expiry &&
        other.kyc_image == kyc_image &&
        other.gstin_image == gstin_image &&
        other.fssai_image == fssai_image &&
        other.type_of_estd == type_of_estd &&
        other.types_of_cusine == types_of_cusine &&
        other.start_time == start_time &&
        other.end_time == end_time &&
        other.open_days == open_days &&
        other.completed_till == completed_till &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bio.hashCode ^
        resName.hashCode ^
        own_name.hashCode ^
        own_mobile.hashCode ^
        res_city.hashCode ^
        poc.hashCode ^
        poc_number.hashCode ^
        address.hashCode ^
        postal_code.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        gstin_present.hashCode ^
        gstin_num.hashCode ^
        fssai_status.hashCode ^
        fssai_expiry.hashCode ^
        kyc_image.hashCode ^
        gstin_image.hashCode ^
        fssai_image.hashCode ^
        type_of_estd.hashCode ^
        types_of_cusine.hashCode ^
        start_time.hashCode ^
        end_time.hashCode ^
        open_days.hashCode ^
        completed_till.hashCode ^
        user.hashCode;
  }
}
