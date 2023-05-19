import 'package:flutter/material.dart';


class DishCategory {
  final String id;
  final String name;
  final List<Dish> dishes;

  DishCategory({required this.id, required this.name, required this.dishes});

  factory DishCategory.fromJson(Map<String, dynamic> json) {
    List<Dish> dishes = [];
    if (json['dishes'] != null && json['dishes'] is List) {
      dishes = json['dishes']
          .map((dish) => Dish.fromJson(dish))
          .toList()
          .cast<Dish>();
    }
    return DishCategory(
      id: json['id'],
      name: json['name'],
      dishes: dishes,
    );
  }
}


class Dish {
  final String id;
  final String name;
  final String? addonCategory;
  final double price;

  Dish({required this.id, required this.name, this.addonCategory, required this.price});

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      addonCategory: json['addoncat'],
      price: json['price'].toDouble(),
    );
  }
}

class CartItem {
  final Dish dish;
  int count;

  CartItem({required this.dish, this.count = 0});
}
enum DishCurrency { INR }

final dishCurrencyValues = EnumValues({"INR": DishCurrency.INR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}