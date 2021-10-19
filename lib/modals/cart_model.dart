import 'dart:convert';

import 'package:get/get.dart';

List<CartModel> cartItems = [];

class CartModel {
  RxInt id;
  RxInt quantity;
  CartModel({
    required this.id,
    required this.quantity,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartModel(id: $id, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel && other.id == id && other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;
}
