import 'dart:convert';

import 'package:readyplates/models/food_item_model.dart';

class Bio {
  final int id;
  final String advance_orders;
  final String no_of_orders;
  final String description;
  final String no_of_tables;
  final String max_table_size;
  final String cost_for_two;
  final String servingTime;
  final String recurring_event_date;
  final String recur_freq;
  final String event_start;
  final String event_end;
  final String event_name;
  final String event_desc;
  final String front_fascia_day;
  final String front_fascia_night;
  final String street_view;
  final String entrance;
  final String ambience1;
  final String ambience2;
  final String ambience3;
  final String ambience4;
  final String food1;
  final String food2;
  final String food3;
  final String food4;
  final String cv19prec1;
  final String cv19prec2;
  final String cv19prec3;
  final String cv19prec4;
  final int completed_till;
  final int user;
  Bio({
    required this.id,
    required this.advance_orders,
    required this.no_of_orders,
    required this.description,
    required this.no_of_tables,
    required this.max_table_size,
    required this.cost_for_two,
    required this.servingTime,
    required this.recurring_event_date,
    required this.recur_freq,
    required this.event_start,
    required this.event_end,
    required this.event_name,
    required this.event_desc,
    required this.front_fascia_day,
    required this.front_fascia_night,
    required this.street_view,
    required this.entrance,
    required this.ambience1,
    required this.ambience2,
    required this.ambience3,
    required this.ambience4,
    required this.food1,
    required this.food2,
    required this.food3,
    required this.food4,
    required this.cv19prec1,
    required this.cv19prec2,
    required this.cv19prec3,
    required this.cv19prec4,
    required this.completed_till,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'no_of_tables': no_of_tables,
      'max_table_size': max_table_size,
      'cost_for_two': cost_for_two,
      'serving_time': servingTime,
      'recurring_event_date': recurring_event_date,
      'recur_freq': recur_freq,
      'event_start': event_start,
      'event_end': event_end,
      'event_name': event_name,
      'event_desc': event_desc,
      'front_fascia_day': front_fascia_day,
      'front_fascia_night': front_fascia_night,
      'street_view': street_view,
      'entrance': entrance,
      'ambience1': ambience1,
      'ambience2': ambience2,
      'ambience3': ambience3,
      'ambience4': ambience4,
      'food1': food1,
      'food2': food2,
      'food3': food3,
      'food4': food4,
      'cv19prec1': cv19prec1,
      'cv19prec2': cv19prec2,
      'cv19prec3': cv19prec3,
      'cv19prec4': cv19prec4,
      'completed_till': completed_till,
      'user': user,
    };
  }

  factory Bio.fromMap(Map<String, dynamic> map) {
    return Bio(
      advance_orders: map['advance_orders'] ?? "5",
      no_of_orders: map['no_of_orders'] ?? "0",
      id: map['id']?.toInt(),
      description: map['description'] ?? "",
      no_of_tables: map['no_of_tables'] ?? "",
      max_table_size: map['max_table_size'] ?? "",
      cost_for_two: map['cost_for_two'] ?? "",
      servingTime: map['serving_time'] ?? "",
      recurring_event_date: map['recurring_event_date'] ?? "",
      recur_freq: map['recur_freq'] ?? "",
      event_start: map['event_start'] ?? "",
      event_end: map['event_end'] ?? "",
      event_desc: map['event_desc'] ?? "",
      event_name: map['event_name'] ?? "",
      front_fascia_day: getUrl(map['front_fascia_day'] ?? ""),
      front_fascia_night: getUrl(map['front_fascia_night'] ?? ""),
      street_view: getUrl(map['street_view'] ?? ""),
      entrance: getUrl(map['entrance'] ?? ""),
      ambience1: getUrl(map['ambience1'] ?? ""),
      ambience2: getUrl(map['ambience2'] ?? ""),
      ambience3: getUrl(map['ambience3'] ?? ""),
      ambience4: getUrl(map['ambience4'] ?? ""),
      food1: getUrl(map['food1'] ?? ""),
      food2: getUrl(map['food2'] ?? ""),
      food3: getUrl(map['food3'] ?? ""),
      food4: getUrl(map['food4'] ?? ""),
      cv19prec1: getUrl(map['cv19prec1'] ?? ""),
      cv19prec2: getUrl(map['cv19prec2'] ?? ""),
      cv19prec3: getUrl(map['cv19prec3'] ?? ""),
      cv19prec4: getUrl(map['cv19prec4'] ?? ""),
      completed_till: map['completed_till']?.toInt(),
      user: map['user']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bio.fromJson(String source) => Bio.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Bio(id: $id, description: $description, no_of_tables: $no_of_tables, max_table_size: $max_table_size, cost_for_two: $cost_for_two, serving_time: $servingTime, recurring_event_date: $recurring_event_date, recur_freq: $recur_freq, event_start: $event_start, event_end: $event_end, event_desc: $event_desc, event_name: $event_name, front_fascia_day: $front_fascia_day, front_fascia_night: $front_fascia_night, street_view: $street_view, entrance: $entrance, ambience1: $ambience1, ambience2: $ambience2, ambience3: $ambience3, ambience4: $ambience4, food1: $food1, food2: $food2, food3: $food3, food4: $food4, cv19prec1: $cv19prec1, cv19prec2: $cv19prec2, cv19prec3: $cv19prec3, cv19prec4: $cv19prec4, completed_till: $completed_till, user: $user)';
  }


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bio &&
        other.id == id &&
        other.description == description &&
        other.no_of_tables == no_of_tables &&
        other.max_table_size == max_table_size &&
        other.cost_for_two == cost_for_two &&
        other.servingTime == servingTime &&
        other.recurring_event_date == recurring_event_date &&
        other.recur_freq == recur_freq &&
        other.event_start == event_start &&
        other.event_end == event_end &&
        other.event_name == event_name &&
        other.event_desc == event_desc &&
        other.front_fascia_day == front_fascia_day &&
        other.front_fascia_night == front_fascia_night &&
        other.street_view == street_view &&
        other.entrance == entrance &&
        other.ambience1 == ambience1 &&
        other.ambience2 == ambience2 &&
        other.ambience3 == ambience3 &&
        other.ambience4 == ambience4 &&
        other.food1 == food1 &&
        other.food2 == food2 &&
        other.food3 == food3 &&
        other.food4 == food4 &&
        other.cv19prec1 == cv19prec1 &&
        other.cv19prec2 == cv19prec2 &&
        other.cv19prec3 == cv19prec3 &&
        other.cv19prec4 == cv19prec4 &&
        other.completed_till == completed_till &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        no_of_tables.hashCode ^
        max_table_size.hashCode ^
        cost_for_two.hashCode ^
        servingTime.hashCode ^
        recurring_event_date.hashCode ^
        recur_freq.hashCode ^
        event_start.hashCode ^
        event_end.hashCode ^
        event_name.hashCode ^
        event_desc.hashCode ^
        front_fascia_day.hashCode ^
        front_fascia_night.hashCode ^
        street_view.hashCode ^
        entrance.hashCode ^
        ambience1.hashCode ^
        ambience2.hashCode ^
        ambience3.hashCode ^
        ambience4.hashCode ^
        food1.hashCode ^
        food2.hashCode ^
        food3.hashCode ^
        food4.hashCode ^
        cv19prec1.hashCode ^
        cv19prec2.hashCode ^
        cv19prec3.hashCode ^
        cv19prec4.hashCode ^
        completed_till.hashCode ^
        user.hashCode;
  }
}
