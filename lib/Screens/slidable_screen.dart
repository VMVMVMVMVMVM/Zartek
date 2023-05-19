
import 'package:flutter/material.dart';

import '../models/itemMenu.dart';
import '../models/product.dart';

class SlidableDishCategory extends StatefulWidget {
  final DishCategory category;
  final List<CartItem> cartItems;
  final Function(Dish) onAddToCart;
  final Function(Dish) onRemoveFromCart;

  SlidableDishCategory({
    required this.category,
    required this.cartItems,
    required this.onAddToCart,
    required this.onRemoveFromCart,
  });

  @override
  _SlidableDishCategoryState createState() => _SlidableDishCategoryState();
}

class _SlidableDishCategoryState extends State<SlidableDishCategory> {
  bool isCategoryExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.category.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            setState(() {
              isCategoryExpanded = !isCategoryExpanded;
            });
          },
          trailing: isCategoryExpanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
        ),
        isCategoryExpanded
            ? ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.category.dishes.length,
          itemBuilder: (context, index) {
            final dish = widget.category.dishes[index];
            bool hasCustomizations = dish.addonCategory != null;
            int itemCount = 0;
            for (var item in widget.cartItems) {
              if (item.dish.id == dish.id) {
                itemCount = item.count;
                break;
              }
            }
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dish.name),
                  if (hasCustomizations) Text('Customizations available'),
                ],
              ),
              subtitle: Text('INR ${dish.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => widget.onRemoveFromCart(dish),
                  ),
                  Text(itemCount.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => widget.onAddToCart(dish),
                  ),
                ],
              ),
            );
          },
        )
            : Container(),
      ],
    );
  }
}
