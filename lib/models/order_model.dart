import 'dart:convert';
import 'package:flutter/foundation.dart';

class OrderModel {
  int user;
  int restaurant;
  List<OrderFoodItem> orderitems;
  int noOfPeople;
  int noOfTable;
  int tax;
  int totalprice;
  String date;
  String time;
  OrderModel({
    required this.user,
    required this.restaurant,
    required this.orderitems,
    required this.noOfPeople,
    required this.noOfTable,
    required this.tax,
    required this.totalprice,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'restaurant': restaurant,
      'orderitems': orderitems.map((x) => x.toMap()).toList(),
      'no_of_people': noOfPeople,
      'no_of_table': noOfTable,
      'tax': tax,
      'totalprice': totalprice,
      'date': date,
      'time': time,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'OrderModel(user: $user, restaurant: $restaurant, orderitems: $orderitems, no_of_people: $noOfPeople, no_of_table: $noOfTable, tax: $tax, totalprice: $totalprice, date: $date, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderModel &&
      other.user == user &&
      other.restaurant == restaurant &&
      listEquals(other.orderitems, orderitems) &&
      other.noOfPeople == noOfPeople &&
      other.noOfTable == noOfTable &&
      other.tax == tax &&
      other.totalprice == totalprice &&
      other.date == date &&
      other.time == time;
  }

  @override
  int get hashCode {
    return user.hashCode ^
      restaurant.hashCode ^
      orderitems.hashCode ^
      noOfPeople.hashCode ^
      noOfTable.hashCode ^
      tax.hashCode ^
      totalprice.hashCode ^
      date.hashCode ^
      time.hashCode;
  }
}

class OrderModelApi {
  int orderId;
  int orderPin;
  int userId;
  int restaurantId;
  String restaurantName;
  List<OrderFoodItemApi> cartModel;
  int noOfPeople;
  int noOfTable;
  int taxes;
  int totalPrice;
  String schedule;
  OrderModelApi({
    required this.orderId,
    required this.orderPin,
    required this.userId,
    required this.restaurantId,
    required this.restaurantName,
    required this.cartModel,
    required this.noOfPeople,
    required this.noOfTable,
    required this.taxes,
    required this.totalPrice,
    required this.schedule,
  });

  OrderModelApi copyWith({
    int? orderId,
    int? orderPin,
    int? userId,
    int? restaurantId,
    String? restaurantName,
    List<OrderFoodItemApi>? cartModel,
    int? noOfPeople,
    int? noOfTable,
    int? taxes,
    int? totalPrice,
    String? schedule,
  }) {
    return OrderModelApi(
      orderId: orderId ?? this.orderId,
      orderPin: orderPin ?? this.orderPin,
      userId: userId ?? this.userId,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      cartModel: cartModel ?? this.cartModel,
      noOfPeople: noOfPeople ?? this.noOfPeople,
      noOfTable: noOfTable ?? this.noOfTable,
      taxes: taxes ?? this.taxes,
      totalPrice: totalPrice ?? this.totalPrice,
      schedule: schedule ?? this.schedule,
    );
  }

  factory OrderModelApi.fromMap(Map<String, dynamic> map) {
    return OrderModelApi(
      orderId: map['orderId'],
      orderPin: map['orderPin'],
      userId: map['userId'],
      restaurantId: map['restaurantId'],
      restaurantName: map['restaurantName'],
      cartModel: List<OrderFoodItemApi>.from(
          map['cartModel']?.map((x) => OrderFoodItemApi.fromMap(x))),
      noOfPeople: map['noOfPeople'],
      noOfTable: map['noOfTable'],
      taxes: map['taxes'],
      totalPrice: map['totalPrice'],
      schedule: map['schedule'],
    );
  }

  factory OrderModelApi.fromJson(String source) =>
      OrderModelApi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModelApi(orderId: $orderId, orderPin: $orderPin, userId: $userId, restaurantId: $restaurantId, restaurantName: $restaurantName, cartModel: $cartModel, noOfPeople: $noOfPeople, noOfTable: $noOfTable, taxes: $taxes, totalPrice: $totalPrice, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModelApi &&
        other.orderId == orderId &&
        other.orderPin == orderPin &&
        other.userId == userId &&
        other.restaurantId == restaurantId &&
        other.restaurantName == restaurantName &&
        listEquals(other.cartModel, cartModel) &&
        other.noOfPeople == noOfPeople &&
        other.noOfTable == noOfTable &&
        other.taxes == taxes &&
        other.totalPrice == totalPrice &&
        other.schedule == schedule;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        orderPin.hashCode ^
        userId.hashCode ^
        restaurantId.hashCode ^
        restaurantName.hashCode ^
        cartModel.hashCode ^
        noOfPeople.hashCode ^
        noOfTable.hashCode ^
        taxes.hashCode ^
        totalPrice.hashCode ^
        schedule.hashCode;
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
      'id': id,
      'count': count,
      'price': price,
    };
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
  String name;
  int price;
  int count;
  OrderFoodItemApi({
    required this.id,
    required this.name,
    required this.price,
    required this.count,
  });

  factory OrderFoodItemApi.fromMap(Map<String, dynamic> map) {
    return OrderFoodItemApi(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      count: map['count'],
    );
  }

  factory OrderFoodItemApi.fromJson(String source) =>
      OrderFoodItemApi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderFoodItemApi(id: $id, name: $name, price: $price, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderFoodItemApi &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.count == count;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ count.hashCode;
  }
}
