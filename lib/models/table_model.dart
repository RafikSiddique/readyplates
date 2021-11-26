import 'dart:convert';


class TableModel {
  int restaurant;
  int capacity;
  String orderdate;
  String starttime;
  String endtime;

  TableModel({
    required this.restaurant,
    required this.capacity,
    required this.orderdate,
    required this.starttime,
    required this.endtime,
  });



  Map<String, dynamic> toMap() {
    return {
      'restaurant': restaurant,
      'capacity': capacity,
      'orderdate': orderdate,
      'starttime': starttime,
      'endtime': endtime,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      restaurant: map['restaurant'],
      capacity: map['capacity'],
      orderdate: map['orderdate'],
      starttime: map['starttime'],
      endtime: map['endtime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TableModel.fromJson(String source) => TableModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'tablemodelapi(restaurant: $restaurant, capacity: $capacity, orderdate: $orderdate, starttime: $starttime, endtime: $endtime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TableModelapi &&
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


class TableModelapi {
  int restaurant;
  int capacity;
  int orderdate;
  String starttime;
  String endtime;

  TableModelapi({
    required this.restaurant,
    required this.capacity,
    required this.orderdate,
    required this.starttime,
    required this.endtime,
  });

  TableModelapi copyWith({
    int? restaurant,
    int? capacity,
    int? orderdate,
    String? starttime,
    String? endtime,
  }) {
    return TableModelapi(
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

  factory TableModelapi.fromMap(Map<String, dynamic> map) {
    return TableModelapi(
      restaurant: map['restaurant'],
      capacity: map['capacity'],
      orderdate: map['orderdate'],
      starttime: map['starttime'],
      endtime: map['endtime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TableModelapi.fromJson(String source) => TableModelapi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'tablemodelapi(restaurant: $restaurant, capacity: $capacity, orderdate: $orderdate, starttime: $starttime, endtime: $endtime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TableModelapi &&
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
