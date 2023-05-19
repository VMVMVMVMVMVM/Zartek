import 'dart:convert';

import 'package:flutter/material.dart';

import '../Screens/slidable_screen.dart';
import '../models/itemMenu.dart';
import '../models/product.dart';

import 'package:http/http.dart' as http;

class ItemTile extends StatefulWidget {
  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  // final Welcome welcome;
  List<DishCategory> dishCategories = [];

  late List<CartItem> cartItems;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDishCategories();
    cartItems = [];
  }

  Future<void> fetchDishCategories() async {
    final response = await http.get(Uri.parse('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad'));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      if (jsonBody is Map && jsonBody.containsKey('categories') && jsonBody['categories'] is List) {
        setState(() {
          dishCategories = List.from(jsonBody['categories'])
              .map((category) => DishCategory.fromJson(category))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Invalid API response');
      }
    } else {
      throw Exception('Failed to fetch dish categories');
    }
  }

  void addToCart(Dish dish) {
    bool isNewItem = true;
    for (var item in cartItems) {
      if (item.dish.id == dish.id) {
        item.count++;
        isNewItem = false;
        break;
      }
    }
    if (isNewItem) {
      cartItems.add(CartItem(dish: dish, count: 1));
    }
    setState(() {});
  }

  void removeFromCart(Dish dish) {
    for (var item in cartItems) {
      if (item.dish.id == dish.id) {
        if (item.count > 0) {
          item.count--;
        }
        break;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: dishCategories.length,
        itemBuilder: (context, index) {
          final category = dishCategories[index];
          return SlidableDishCategory(
            category: category,
            cartItems: cartItems,
            onAddToCart: addToCart,
            onRemoveFromCart: removeFromCart,
          );
        },
      ),
    );
  }
}
