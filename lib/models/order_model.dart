import 'dart:convert';

class OrderModel {
  String user;
  String restaurant;
  String menu;
  String name;
  double price;
  int quantity;
  int noOfTable;
  int noOfPeople;
  double time;

  double tax;
  OrderModel({
    required this.user,
    required this.restaurant,
    required this.menu,
    required this.name,
    required this.price,
    required this.quantity,
    required this.noOfTable,
    required this.noOfPeople,
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
    int? noOfTable,
    int? noOfPeople,
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
      noOfTable: noOfTable ?? this.noOfTable,
      noOfPeople: noOfPeople ?? this.noOfPeople,
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
      'no_of_table': noOfTable,
      'no_of_people': noOfPeople,
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
      noOfTable: map['no_of_table'],
      noOfPeople: map['no_of_people'],
      time: map['time'],
      tax: map['tax'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(user: $user, restaurant: $restaurant, menu: $menu, name: $name, price: $price, quantity: $quantity, no_of_table: $noOfTable, no_of_people: $noOfPeople, time: $time, tax: $tax)';
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
        other.noOfTable == noOfTable &&
        other.noOfPeople == noOfPeople &&
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
        noOfTable.hashCode ^
        noOfPeople.hashCode ^
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
