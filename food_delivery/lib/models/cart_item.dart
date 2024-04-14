// import 'package:food_delivery/models/food.dart';

// class CartItem {
//   Food food;
//   List<Addon> selectedAddons;
//   int quantity;

//   CartItem({
//     required this.food,
//     required this.selectedAddons,
//     this.quantity = 1,
//   });

//   double get totalPrice {
//     double addonsPrice = selectedAddons.fold(0, (sum, Addon) => sum + Addon.price);
//     return (food.price + addonsPrice  ) * quantity;
//     // ignore: dead_code
//     return (addonsPrice)* quantity;
//   }

 
// }

import 'package:food_delivery/models/food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    // Parse food price string to double
    double foodPrice = double.parse(food.price);

    // Calculate addons price
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);

    // Calculate total price
    return (foodPrice + addonsPrice) * quantity;
  }
}


