import 'dart:convert';

String getUrl(String url) {
  // http://202.53.174.5:8000/
  //https://readyplates.herokuapp.com/
  return "https://readyplates.herokuapp.com" + url;
}

class FoodItemModel {
  final int id;
  final String name;
  final String description;
  final String image1;

  final String dietType;
  final String category;
  final String stdServingSize;
  final String otherServingSize;
  final String otherServingCost;
  final String spiceLevel;
  final String cost;
  final int restaurant;
  FoodItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image1,
    required this.dietType,
    required this.category,
    required this.stdServingSize,
    required this.otherServingSize,
    required this.otherServingCost,
    required this.spiceLevel,
    required this.cost,
    required this.restaurant,
  });

  FoodItemModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image1,
    String? image2,
    String? dietType,
    String? category,
    String? stdServingSize,
    String? otherServingSize,
    String? otherServingCost,
    String? spiceLevel,
    String? cost,
    int? restaurant,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image1: image1 ?? this.image1,
      dietType: dietType ?? this.dietType,
      category: category ?? this.category,
      stdServingSize: stdServingSize ?? this.stdServingSize,
      otherServingSize: otherServingSize ?? this.otherServingSize,
      otherServingCost: otherServingCost ?? this.otherServingCost,
      spiceLevel: spiceLevel ?? this.spiceLevel,
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
      'diet_type': dietType,
      'category': category,
      'std_serving_size': stdServingSize,
      'other_serving_size': otherServingSize,
      'other_serving_cost': otherServingCost,
      'spice_level': spiceLevel,
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
      dietType: map['diet_type'],
      category: map['category'],
      stdServingSize: map['std_serving_size'],
      otherServingSize: map['other_serving_size'] ?? "",
      otherServingCost: map['other_serving_cost'] ?? "",
      spiceLevel: map['spice_level'] ?? "1.0",
      cost: map['cost'] ?? "20",
      restaurant: map['restaurant'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodItemModel.fromJson(String source) =>
      FoodItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodItemModel(id: $id, name: $name, description: $description, image1: $image1, diet_type: $dietType, category: $category, std_serving_size: $stdServingSize, other_serving_size: $otherServingSize, other_serving_cost: $otherServingCost, spice_level: $spiceLevel, cost: $cost, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodItemModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image1 == image1 &&
        other.dietType == dietType &&
        other.category == category &&
        other.stdServingSize == stdServingSize &&
        other.otherServingSize == otherServingSize &&
        other.otherServingCost == otherServingCost &&
        other.spiceLevel == spiceLevel &&
        other.cost == cost &&
        other.restaurant == restaurant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image1.hashCode ^
        dietType.hashCode ^
        category.hashCode ^
        stdServingSize.hashCode ^
        otherServingSize.hashCode ^
        otherServingCost.hashCode ^
        spiceLevel.hashCode ^
        cost.hashCode ^
        restaurant.hashCode;
  }
}
