import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

class OrderEditModel {
  int id;
  int orderId;
  RxInt foodItem;
  RxInt foodQuantity;
  String foodImage;
  RxDouble foodPrice;
  int restaurant;
  String foodName;
  bool isUpdated;
  OrderEditModel({
    required this.orderId,
    required this.foodName,
    required this.id,
    required this.foodItem,
    required this.foodQuantity,
    required this.foodPrice,
    required this.restaurant,
    required this.foodImage,
    required this.isUpdated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'menu': foodItem.value,
      'quantity': foodQuantity.value,
      'price': foodPrice.value,
    };
  }

  Map<String, dynamic> toPut() {
    return {
      'menu': foodItem.value,
      'quantity': foodQuantity.value,
      'price': foodPrice.value,
    };
  }

  String toJson() => json.encode(toMap());
  String toJsonPut() => json.encode(toPut());
}

class CartModel {
  String user;
  RxInt foodItem;
  RxInt foodQuantity;
  String foodImage;
  RxDouble foodPrice;
  int restaurant;
  String foodName;
  CartModel({
    required this.user,
    required this.foodItem,
    required this.foodQuantity,
    required this.foodName,
    required this.foodImage,
    required this.foodPrice,
    required this.restaurant,
  });

  double roundUptoDigits(double number, [int digits = 2]) {
    double mod = pow(10.0, digits) as double;
    return ((number * mod).round().toDouble() / mod);
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'food_item': foodItem.value,
      'food_quantity': foodQuantity.value,
      'food_image': foodImage,
      'food_price': roundUptoDigits(foodPrice.value),
      'restaurant': restaurant,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CartModel(user: $user, food_item: $foodItem, food_quantity: $foodQuantity, food_image: $foodImage, food_price: $foodPrice, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.user == user &&
        other.foodItem == foodItem &&
        other.foodQuantity == foodQuantity &&
        other.foodImage == foodImage &&
        other.foodPrice == foodPrice &&
        other.restaurant == restaurant;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        foodItem.hashCode ^
        foodQuantity.hashCode ^
        foodImage.hashCode ^
        foodPrice.hashCode ^
        restaurant.hashCode;
  }
}

class CartApiModel {
  int id;
  int user;
  int restaurant;
  CartFood foodItem;
  String foodImage;
  int foodQuantity;
  double foodPrice;
  CartApiModel({
    required this.id,
    required this.user,
    required this.restaurant,
    required this.foodItem,
    required this.foodImage,
    required this.foodQuantity,
    required this.foodPrice,
  });

  factory CartApiModel.fromMap(Map<String, dynamic> map) {
    return CartApiModel(
      id: map['id'],
      user: map['user'],
      restaurant: map['restaurant'],
      foodItem: CartFood.fromMap(map['food_item']),
      foodImage: map['food_image'],
      foodQuantity: map['food_quantity'],
      foodPrice: double.parse(map['food_price'].toString()),
    );
  }

  factory CartApiModel.fromJson(String source) =>
      CartApiModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartApiModel(id: $id, user: $user, restaurant: $restaurant, food_item: $foodItem, food_image: $foodImage, food_quantity: $foodQuantity, food_price: $foodPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartApiModel &&
        other.id == id &&
        other.user == user &&
        other.restaurant == restaurant &&
        other.foodItem == foodItem &&
        other.foodImage == foodImage &&
        other.foodQuantity == foodQuantity &&
        other.foodPrice == foodPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        restaurant.hashCode ^
        foodItem.hashCode ^
        foodImage.hashCode ^
        foodQuantity.hashCode ^
        foodPrice.hashCode;
  }
}

class CartFood {
  int id;
  String name;
  CartFood({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CartFood.fromMap(Map<String, dynamic> map) {
    return CartFood(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartFood.fromJson(String source) =>
      CartFood.fromMap(json.decode(source));

  @override
  String toString() => 'CartFood(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartFood && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
