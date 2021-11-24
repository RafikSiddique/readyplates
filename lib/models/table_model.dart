import 'dart:convert';

class tablemodelapi {
  int restaurant;
  int capacity;
  int orderdate;
  String starttime;
  String endtime;

  tablemodelapi({
    required this.restaurant,
    required this.capacity,
    required this.orderdate,
    required this.starttime,
    required this.endtime,
  });

  tablemodelapi copyWith({
    int? restaurant,
    int? capacity,
    int? orderdate,
    String? starttime,
    String? endtime,
  }) {
    return tablemodelapi(
      restaurant: restaurant ?? this.restaurant,
      capacity: capacity ?? this.capacity,
      orderdate: orderdate ?? this.orderdate,
      starttime: starttime ?? this.starttime,
      endtime: endtime ?? this.endtime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'restaurant': restaurant,
      'capacity': capacity,
      'orderdate': orderdate,
      'starttime': starttime,
      'endtime': endtime,
    };
  }

  factory tablemodelapi.fromMap(Map<String, dynamic> map) {
    return tablemodelapi(
      restaurant: map['restaurant'],
      capacity: map['capacity'],
      orderdate: map['orderdate'],
      starttime: map['starttime'],
      endtime: map['endtime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory tablemodelapi.fromJson(String source) => tablemodelapi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'tablemodelapi(restaurant: $restaurant, capacity: $capacity, orderdate: $orderdate, starttime: $starttime, endtime: $endtime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is tablemodelapi &&
      other.restaurant == restaurant &&
      other.capacity == capacity &&
      other.orderdate == orderdate &&
      other.starttime == starttime &&
      other.endtime == endtime;
  }

  @override
  int get hashCode {
    return restaurant.hashCode ^
      capacity.hashCode ^
      orderdate.hashCode ^
      starttime.hashCode ^
      endtime.hashCode;
  }
}
