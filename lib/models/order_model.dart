import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:readyplates/models/food_item_model.dart';

enum OrderState { placed, inProgress, Served, completed, cancelled }

class OrderModel {
  int user;
  int restaurant;
  List<OrderFoodItem> orderitems;
  int noOfPeople;
  int? table;
  int tax;
  double totalprice;
  String date;
  String time;
  String payment;
  String feedbackstat;
  OrderState orderState;
  OrderModel({
    required this.payment,
    required this.user,
    required this.feedbackstat,
    required this.restaurant,
    required this.orderitems,
    required this.noOfPeople,
    required this.orderState,
    required this.table,
    required this.tax,
    required this.totalprice,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'restaurant': restaurant,
      'payment': payment,
      'orderitems': orderitems.map((x) => x.toMap()).toList(),
      'no_of_people': noOfPeople,
      'table': table,
      'feedbackstat': feedbackstat,
      'status': orderState.index,
      'tax': tax,
      'totalprice': roundUptoDigits(totalprice),
      'date': date,
      'time': time,
    };
  }

  double roundUptoDigits(double number, [int digits = 2]) {
    double mod = pow(10.0, digits) as double;
    return ((number * mod).round().toDouble() / mod);
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'OrderModel(user: $user, restaurant: $restaurant, orderitems: $orderitems, no_of_people: $noOfPeople, table: $table, tax: $tax, totalprice: $totalprice, date: $date, time: $time)';
  }
}

class OrderModelApi {
  int id;
  List<OrderFoodItemApi> orderitems;
  DateTime created_on;
  String totalPrice;
  int no_of_people;
  int? table;
  String date;
  String time;
  String feedbackstat;

  String tax;
  OrderState status;
  String payment;
  int pin;
  UserFromApi user;
  OrderApiRestaurant restaurant;
  OrderModelApi({
    required this.id,
    required this.orderitems,
    required this.created_on,
    required this.totalPrice,
    required this.no_of_people,
    required this.feedbackstat,
    required this.table,
    required this.date,
    required this.time,
    required this.tax,
    required this.payment,
    required this.status,
    required this.pin,
    required this.user,
    required this.restaurant,
  });

  factory OrderModelApi.fromMap(Map<String, dynamic> map) {
    return OrderModelApi(
      id: map['id'],
      payment: map["payment"] ?? "0",
      orderitems: List<OrderFoodItemApi>.from(
          map['orderitems']?.map((x) => OrderFoodItemApi.fromMap(x))),
      created_on: DateTime.parse(map['created_on']),
      totalPrice: map['totalprice'],
      no_of_people: map['no_of_people'],
      table: map['table'],
      date: map['date'],
      feedbackstat: map['feedbackstat'] ?? "",
      time: map['time'],
      tax: map['tax'],
      status: OrderState.values[map["status"]],
      pin: map['pin'],
      user: UserFromApi.fromMap(map['user']),
      restaurant: OrderApiRestaurant.fromMap(map['restaurant']),
    );
  }

  factory OrderModelApi.fromJson(String source) =>
      OrderModelApi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModelApi(id: $id, orderitems: $orderitems, created_on: $created_on, totalPrice: $totalPrice, no_of_people: $no_of_people, table: $table, date: $date, time: $time, tax: $tax, status: $status, pin: $pin, user: $user, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModelApi &&
        other.id == id &&
        listEquals(other.orderitems, orderitems) &&
        other.created_on == created_on &&
        other.totalPrice == totalPrice &&
        other.no_of_people == no_of_people &&
        other.table == table &&
        other.date == date &&
        other.time == time &&
        other.tax == tax &&
        other.status == status &&
        other.pin == pin &&
        other.user == user &&
        other.restaurant == restaurant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        orderitems.hashCode ^
        created_on.hashCode ^
        totalPrice.hashCode ^
        no_of_people.hashCode ^
        table.hashCode ^
        date.hashCode ^
        time.hashCode ^
        tax.hashCode ^
        status.hashCode ^
        pin.hashCode ^
        user.hashCode ^
        restaurant.hashCode;
  }
}

class OrderFoodItem {
  int id;
  int count;
  double price;
  OrderFoodItem({
    required this.id,
    required this.count,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'menu': id,
      'quantity': count,
      'price': roundUptoDigits(price),
    };
  }

  double roundUptoDigits(double number, [int digits = 2]) {
    double mod = pow(10.0, digits) as double;
    return ((number * mod).round().toDouble() / mod);
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'OrderFoodItem(id: $id, count: $count, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderFoodItem &&
        other.id == id &&
        other.count == count &&
        other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ count.hashCode ^ price.hashCode;
}

class OrderFoodItemApi {
  int id;
  MenuFromApi menu;
  String price;
  int quantity;
  OrderFoodItemApi({
    required this.id,
    required this.menu,
    required this.price,
    required this.quantity,
  });

  factory OrderFoodItemApi.fromMap(Map<String, dynamic> map) {
    return OrderFoodItemApi(
      id: map['id'],
      menu: MenuFromApi.fromMap(map['menu']),
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  factory OrderFoodItemApi.fromJson(String source) =>
      OrderFoodItemApi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderFoodItemApi(id: $id, menu: $menu, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderFoodItemApi &&
        other.id == id &&
        other.menu == menu &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^ menu.hashCode ^ price.hashCode ^ quantity.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'menu': menu.toMap(),
      'price': price,
      'quantity': quantity,
    };
  }

  String toJson() => json.encode(toMap());
}

class MenuFromApi {
  int id;
  String name;
  String image1;
  MenuFromApi({
    required this.id,
    required this.image1,
    required this.name,
  });

  MenuFromApi copyWith({
    int? id,
    String? name,
  }) {
    return MenuFromApi(
      id: id ?? this.id,
      image1: image1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory MenuFromApi.fromMap(Map<String, dynamic> map) {
    return MenuFromApi(
      image1: getUrl(map['image1'] ?? ""),
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuFromApi.fromJson(String source) =>
      MenuFromApi.fromMap(json.decode(source));

  @override
  String toString() => 'MenuFromApi(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuFromApi && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class OrderApiRestaurant {
  String res_name;
  int id;
  OrderApiRestaurant({
    required this.res_name,
    required this.id,
  });

  OrderApiRestaurant copyWith({
    String? res_name,
    int? id,
  }) {
    return OrderApiRestaurant(
      res_name: res_name ?? this.res_name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'res_name': res_name,
      'id': id,
    };
  }

  factory OrderApiRestaurant.fromMap(Map<String, dynamic> map) {
    return OrderApiRestaurant(
      res_name: map['res_name'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderApiRestaurant.fromJson(String source) =>
      OrderApiRestaurant.fromMap(json.decode(source));

  @override
  String toString() => 'OrderApiRestaurant(res_name: $res_name, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderApiRestaurant &&
        other.res_name == res_name &&
        other.id == id;
  }

  @override
  int get hashCode => res_name.hashCode ^ id.hashCode;
}

class UserFromApi {
  String first_name;
  String last_name;
  UserFromApi({
    required this.first_name,
    required this.last_name,
  });

  UserFromApi copyWith({
    String? first_name,
    String? last_name,
  }) {
    return UserFromApi(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
    };
  }

  factory UserFromApi.fromMap(Map<String, dynamic> map) {
    return UserFromApi(
      first_name: map['first_name'],
      last_name: map['last_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFromApi.fromJson(String source) =>
      UserFromApi.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserFromApi(first_name: $first_name, last_name: $last_name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserFromApi &&
        other.first_name == first_name &&
        other.last_name == last_name;
  }

  @override
  int get hashCode => first_name.hashCode ^ last_name.hashCode;
}
