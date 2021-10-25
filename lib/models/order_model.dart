import 'dart:convert';

import 'package:get/get.dart';

class OrderModel {
  String user;
  String restaurant;
  String menu;
  String name;
  double price;
  int quantity;
  int no_of_table;
  int no_of_people;
  double time;

  double tax;
  OrderModel({
    required this.user,
    required this.restaurant,
    required this.menu,
    required this.name,
    required this.price,
    required this.quantity,
    required this.no_of_table,
    required this.no_of_people,
    required this.time,
    required this.tax,
  });

  OrderModel copyWith({
    String? user,
    String? restaurant,
    String? menu,
    String? name,
    double? price,
    int? quantity,
    int? no_of_table,
    int? no_of_people,
    double? time,
    double? tax,
  }) {
    return OrderModel(
      user: user ?? this.user,
      restaurant: restaurant ?? this.restaurant,
      menu: menu ?? this.menu,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      no_of_table: no_of_table ?? this.no_of_table,
      no_of_people: no_of_people ?? this.no_of_people,
      time: time ?? this.time,
      tax: tax ?? this.tax,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'restaurant': restaurant,
      'menu': menu,
      'name': name,
      'price': price,
      'quantity': quantity,
      'no_of_table': no_of_table,
      'no_of_people': no_of_people,
      'time': time,
      'tax': tax,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      user: map['user'],
      restaurant: map['restaurant'],
      menu: map['menu'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      no_of_table: map['no_of_table'],
      no_of_people: map['no_of_people'],
      time: map['time'],
      tax: map['tax'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(user: $user, restaurant: $restaurant, menu: $menu, name: $name, price: $price, quantity: $quantity, no_of_table: $no_of_table, no_of_people: $no_of_people, time: $time, tax: $tax)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.user == user &&
        other.restaurant == restaurant &&
        other.menu == menu &&
        other.name == name &&
        other.price == price &&
        other.quantity == quantity &&
        other.no_of_table == no_of_table &&
        other.no_of_people == no_of_people &&
        other.time == time &&
        other.tax == tax;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        restaurant.hashCode ^
        menu.hashCode ^
        name.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        no_of_table.hashCode ^
        no_of_people.hashCode ^
        time.hashCode ^
        tax.hashCode;
  }
}


// {

//   "user":"",
//   "restaurant": ""
//   "menu": ""
//   "name":
//   "price":
//   "quantity":
//   "no_of_table":
//   "no_of_people":
//   "time":
//   "price":
//   "tax":
// }
