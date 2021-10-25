import 'dart:convert';

String getUrl(String url) {
  // // http://202.53.174.5:8000/
  return "http://202.53.174.5:8000" + url;
}

class FoodItemModel {
  final int id;
  final String name;
  final String description;
  final String image1;
  final String image2;
  final String diet_type;
  final String category;
  final String std_serving_size;
  final String other_serving_size;
  final String other_serving_cost;
  final String spice_level;
  final String cost;
  final int restaurant;
  FoodItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image1,
    required this.image2,
    required this.diet_type,
    required this.category,
    required this.std_serving_size,
    required this.other_serving_size,
    required this.other_serving_cost,
    required this.spice_level,
    required this.cost,
    required this.restaurant,
  });

  FoodItemModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image1,
    String? image2,
    String? diet_type,
    String? category,
    String? std_serving_size,
    String? other_serving_size,
    String? other_serving_cost,
    String? spice_level,
    String? cost,
    int? restaurant,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      diet_type: diet_type ?? this.diet_type,
      category: category ?? this.category,
      std_serving_size: std_serving_size ?? this.std_serving_size,
      other_serving_size: other_serving_size ?? this.other_serving_size,
      other_serving_cost: other_serving_cost ?? this.other_serving_cost,
      spice_level: spice_level ?? this.spice_level,
      cost: cost ?? this.cost,
      restaurant: restaurant ?? this.restaurant,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image1': image1,
      'image2': image2,
      'diet_type': diet_type,
      'category': category,
      'std_serving_size': std_serving_size,
      'other_serving_size': other_serving_size,
      'other_serving_cost': other_serving_cost,
      'spice_level': spice_level,
      'cost': cost,
      'restaurant': restaurant,
    };
  }

  factory FoodItemModel.fromMap(Map<String, dynamic> map) {
    return FoodItemModel(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      image1: getUrl(map['image1']),
      image2: getUrl(map['image2']),
      diet_type: map['diet_type'],
      category: map['category'],
      std_serving_size: map['std_serving_size'],
      other_serving_size: map['other_serving_size'],
      other_serving_cost: map['other_serving_cost'],
      spice_level: map['spice_level'],
      cost: map['cost'],
      restaurant: map['restaurant'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodItemModel.fromJson(String source) =>
      FoodItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodItemModel(id: $id, name: $name, description: $description, image1: $image1, image2: $image2, diet_type: $diet_type, category: $category, std_serving_size: $std_serving_size, other_serving_size: $other_serving_size, other_serving_cost: $other_serving_cost, spice_level: $spice_level, cost: $cost, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodItemModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image1 == image1 &&
        other.image2 == image2 &&
        other.diet_type == diet_type &&
        other.category == category &&
        other.std_serving_size == std_serving_size &&
        other.other_serving_size == other_serving_size &&
        other.other_serving_cost == other_serving_cost &&
        other.spice_level == spice_level &&
        other.cost == cost &&
        other.restaurant == restaurant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image1.hashCode ^
        image2.hashCode ^
        diet_type.hashCode ^
        category.hashCode ^
        std_serving_size.hashCode ^
        other_serving_size.hashCode ^
        other_serving_cost.hashCode ^
        spice_level.hashCode ^
        cost.hashCode ^
        restaurant.hashCode;
  }
}
