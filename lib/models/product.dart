// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Welcome> welcomeFromJson(String str) =>
//     List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
//
// String welcomeToJson(List<Welcome> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// List<DishCategory> categoryDishFromJson(String str) => List<DishCategory>.from(
//     json.decode(str).map((x) => DishCategory.fromJson(x)));
//
// String categoryDishToJson(List<Welcome> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Welcome {
//   String restaurantId;
//   String restaurantName;
//   String restaurantImage;
//   String tableId;
//   String tableName;
//   String branchName;
//   String nexturl;
//   List<TableMenuList> tableMenuList;
//
//   Welcome({
//     required this.restaurantId,
//     required this.restaurantName,
//     required this.restaurantImage,
//     required this.tableId,
//     required this.tableName,
//     required this.branchName,
//     required this.nexturl,
//     required this.tableMenuList,
//   });
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         restaurantId: json["restaurant_id"],
//         restaurantName: json["restaurant_name"],
//         restaurantImage: json["restaurant_image"],
//         tableId: json["table_id"],
//         tableName: json["table_name"],
//         branchName: json["branch_name"],
//         nexturl: json["nexturl"],
//         tableMenuList: List<TableMenuList>.from(
//             json["table_menu_list"].map((x) => TableMenuList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "restaurant_id": restaurantId,
//         "restaurant_name": restaurantName,
//         "restaurant_image": restaurantImage,
//         "table_id": tableId,
//         "table_name": tableName,
//         "branch_name": branchName,
//         "nexturl": nexturl,
//         "table_menu_list":
//             List<dynamic>.from(tableMenuList.map((x) => x.toJson())),
//       };
// }
//
// class TableMenuList {
//   String menuCategory;
//   String menuCategoryId;
//   String menuCategoryImage;
//   String nexturl;
//   List<DishCategory> categoryDishes;
//
//   TableMenuList({
//     required this.menuCategory,
//     required this.menuCategoryId,
//     required this.menuCategoryImage,
//     required this.nexturl,
//     required this.categoryDishes,
//   });
//
//   factory TableMenuList.fromJson(Map<String, dynamic> json) => TableMenuList(
//         menuCategory: json["menu_category"],
//         menuCategoryId: json["menu_category_id"],
//         menuCategoryImage: json["menu_category_image"],
//         nexturl: json["nexturl"],
//         categoryDishes: List<DishCategory>.from(
//             json["category_dishes"].map((x) => DishCategory.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "menu_category": menuCategory,
//         "menu_category_id": menuCategoryId,
//         "menu_category_image": menuCategoryImage,
//         "nexturl": nexturl,
//         "category_dishes":
//             List<dynamic>.from(categoryDishes.map((x) => x.toJson())),
//       };
// }
//
// class AddonCat {
//   String addonCategory;
//   String addonCategoryId;
//   int addonSelection;
//   String nexturl;
//   List<DishCategory> addons;
//
//   AddonCat({
//     required this.addonCategory,
//     required this.addonCategoryId,
//     required this.addonSelection,
//     required this.nexturl,
//     required this.addons,
//   });
//
//   factory AddonCat.fromJson(Map<String, dynamic> json) => AddonCat(
//         addonCategory: json["addon_category"],
//         addonCategoryId: json["addon_category_id"],
//         addonSelection: json["addon_selection"],
//         nexturl: json["nexturl"],
//         addons: List<DishCategory>.from(
//             json["addons"].map((x) => DishCategory.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "addon_category": addonCategory,
//         "addon_category_id": addonCategoryId,
//         "addon_selection": addonSelection,
//         "nexturl": nexturl,
//         "addons": List<dynamic>.from(addons.map((x) => x.toJson())),
//       };
// }
//
// class DishCategory {
//   String dishId;
//   String dishName;
//   double dishPrice;
//   String dishImage;
//   DishCurrency? dishCurrency;
//   double dishCalories;
//   String dishDescription;
//   // bool dishAvailability;
//   // int dishType;
//   String nexturl;
//
// //   List<AddonCat> addonCat;
//
//   DishCategory({
//     required this.dishId,
//     required this.dishName,
//     required this.dishPrice,
//     required this.dishImage,
//     required this.dishCurrency,
//     required this.dishCalories,
//     required this.dishDescription,
//     // required this.dishAvailability,
//     // required this.dishType,
//     required this.nexturl,
//    // required this.addonCat,
//   });
//
//   factory DishCategory.fromJson(Map<String, dynamic> json) => DishCategory(
//         dishId: json["dish_id"].toString(),
//         dishName: json["dish_name"].toString(),
//         dishPrice: json["dish_price"] == null ? 0.0 : json['dish_price'].toDouble(),
//         dishImage: json["dish_image"].toString(),
//         dishCurrency: dishCurrencyValues.map[json["dish_currency"]],
//         dishCalories: json["dish_calories"] == null ? 0.0 : json['dish_calories'].toDouble(),
//         dishDescription: json["dish_description"].toString(),
//         // dishAvailability: json["dish_Availability"],
//         // dishType: json["dish_Type"],
//         nexturl: json["nexturl"].toString(),
//         // addonCat: List<AddonCat>.from(json["addonCat"].map((x) => AddonCat.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//          "dish_id": dishId,
//         "dish_name": dishName,
//         "dish_price": dishPrice,
//         "dish_image": dishImage,
//         "dish_currency": dishCurrencyValues.reverse[dishCurrency],
//         "dish_calories": dishCalories,
//         "dish_description": dishDescription,
//         // "dish_Availability": dishAvailability,
//         // "dish_Type": dishType,
//         "nexturl": nexturl,
//         // "addonCat": List<dynamic>.from(addonCat.map((x) => x.toJson())),
//       };
// }
// class Dish {
//   final String id;
//   final String name;
//   final String? addonCategory;
//   final double price;
//
//   Dish({required this.id, required this.name, this.addonCategory, required this.price});
//
//   factory Dish.fromJson(Map<String, dynamic> json) {
//     return Dish(
//       id: json['id'],
//       name: json['name'],
//       addonCategory: json['addoncat'],
//       price: json['price'].toDouble(),
//     );
//   }
// }
//
// class CartItem {
//   final Dish dish;
//   int count;
//
//   CartItem({required this.dish, this.count = 0});
// }
//
// enum DishCurrency { INR }
//
// final dishCurrencyValues = EnumValues({"INR": DishCurrency.INR});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
