import 'dart:convert';

class TableModel {
  final int id;
  final int capacity;
  final bool available;
  final int restaurant;
  TableModel({
    required this.id,
    required this.capacity,
    required this.available,
    required this.restaurant,
  });

  TableModel copyWith({
    int? id,
    int? capacity,
    bool? available,
    int? restaurant,
  }) {
    return TableModel(
      id: id ?? this.id,
      capacity: capacity ?? this.capacity,
      available: available ?? this.available,
      restaurant: restaurant ?? this.restaurant,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'capacity': capacity,
      'available': available,
      'restaurant': restaurant,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      id: map['id'],
      capacity: map['capacity'],
      available: map['available'],
      restaurant: map['restaurant'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TableModel.fromJson(String source) =>
      TableModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TableModel(id: $id, capacity: $capacity, available: $available, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TableModel &&
        other.id == id &&
        other.capacity == capacity &&
        other.available == available &&
        other.restaurant == restaurant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        capacity.hashCode ^
        available.hashCode ^
        restaurant.hashCode;
  }
}
