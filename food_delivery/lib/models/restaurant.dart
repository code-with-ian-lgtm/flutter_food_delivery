

// import 'package:Food_delivery/models/Food.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:intl/intl.dart';


class Restaurant extends ChangeNotifier{
  //list of Food menu

  final List<Food> _menu = [
    //burgers
    Food(name: "Classic cheese Burger", 
    description: "A juicy beef patty with melted cheddar, lettuce, tomato", 
    imagePath: "lib/images/burger/b1.jpg",
    price: "800", 
    category: FoodCategory.burgers, 
    availableAddons: [
      Addon(name: "Extra cheese", price: 50),
      Addon(name: "Extra Bacon", price: 80),
      Addon(name: "Avocado", price: 20),


    ]),
    Food(name: "Juicy stack burger", 
    description: "Layers of savory, juicy bliss.",
     imagePath: "lib/images/burger/b2.jpg",
      price: "1200", 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Crispy bacon strips", price: 210),
        Addon(name: "Fried onion Rings", price: 120),
        Addon(name: "Fried egg", price: 20),

      ]),
      Food(name: "Flavour fusion", 
      description: "Culinary harmony in every bite", 
      imagePath: "lib/images/burger/b3.jpg", 
      price: "700", 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Spicy kimci", price: 70),
        Addon(name: "Pickled jalapenos", price: 170),
        Addon(name: "Fried green tomatoes", price: 70),

      ]),
      Food(name: "Burger blast",
      description: "Triple the flavor,triple satisfaction",
       imagePath: "lib/images/burger/b4.jpg",
        price: "700", 
        category: FoodCategory.burgers,
         availableAddons: [
          Addon(name: "Crispy hash browns", price: 50),
          Addon(name: "Crispy hash brown", price: 50),
          Addon(name: "Guacamoles", price: 5),

         ]),


    //salads
    Food(name: "Garden Harvest Medley", 
      description: "Fresh veggies, crisp greens, wholesome.", 
      imagePath: "lib/images/salads/s1.jpg", 
      price: "200", 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Grilled chicken strips", price: 70),
        Addon(name: "Toasted almonds or walnuts", price: 170),
        Addon(name: "Feta or goat cheese crumbles", price: 70),

      ]),
      Food(name: "Dried cranberries or raisins", 
      description: "Tangy zest, crunchy bites, refreshing.", 
      imagePath: "lib/images/salads/s2.jpg", 
      price: "150", 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Avocado slices", price: 70),
        Addon(name: "Crispy wonton strips", price: 170),
        Addon(name: "Sliced hard-boiled eggs", price: 70),

      ]),
      Food(name: "Mediterranean Bliss Bowl", 
      description: " Olives, feta, herbs, Mediterranean essence.", 
      imagePath: "lib/images/salads/s3.jpg", 
      price: "300", 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Roasted chickpeas", price: 70),
        Addon(name: "Shredded carrots or red cabbage", price: 170),
        Addon(name: "Edamame beans", price: 70),

      ]),
      Food(name: "Asian Fusion Salad Supreme", 
      description: "ibrant flavors, crunchy textures, exotic.", 
      imagePath: "lib/images/salads/s3.jpg", 
      price: "50/=", 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Sliced strawberries or mandarin oranges", price: 70),
        Addon(name: "Pickled red onions", price: 170),
        Addon(name: "Grilled shrimp or salmon", price: 70),

      ]),
    


    //sides
    Food(name: "Flavour fusion", 
      description: "Culinary harmony in every bite", 
      imagePath: "lib/images/burger/b3.jpg", 
      price: "700", 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Spicy kimci", price: 70),
        Addon(name: "Pickled jalapenos", price: 170),
        Addon(name: "Fried green tomatoes", price: 70),

      ]),Food(name: "Flavour fusion", 
      description: "Culinary harmony in every bite", 
      imagePath: "lib/images/burger/b3.jpg", 
      price: "700", 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Spicy kimci", price: 70),
        Addon(name: "Pickled jalapenos", price: 170),
        Addon(name: "Fried green tomatoes", price: 70),

      ]),Food(name: "Flavour fusion", 
      description: "Culinary harmony in every bite", 
      imagePath: "lib/images/burger/b3.jpg", 
      price: "700", 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Spicy kimci", price: 70),
        Addon(name: "Pickled jalapenos", price: 170),
        Addon(name: "Fried green tomatoes", price: 70),

      ]),Food(name: "Flavour fusion", 
      description: "Culinary harmony in every bite", 
      imagePath: "lib/images/burger/b3.jpg", 
      price: "700", 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Spicy kimci", price: 70),
        Addon(name: "Pickled jalapenos", price: 170),
        Addon(name: "Fried green tomatoes", price: 70),

      ]),


    //desserts
    Food(name: "Decadent Chocolate Lava Cake", 
      description: "Rich, molten, chocolate delight", 
      imagePath: "lib/images/desserts/d1.jpg", 
      price: "550", 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Warm caramel sauce", price: 70),
        Addon(name: "Toasted coconut flakes", price: 170),
        Addon(name: "Crushed nuts (such as almonds or pecans)", price: 70),

      ]),
      Food(name: "Heavenly Lemon Berry Tart", 
      description: "Zesty, fruity, buttery crust.", 
      imagePath: "lib/images/desserts/d2.jpg", 
      price: "720", 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Mint leaf garnish", price: 70),
        Addon(name: "Orange zest sprinkles", price: 170),
        Addon(name: "Espresso shot (for pairing)", price: 70),

      ]),
      Food(name: "Classic Apple Cinnamon Crisp", 
      description: "Warm, comforting, cinnamon-spiced goodness.", 
      imagePath: "lib/images/desserts/d3.jpg", 
      price: "420/=", 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Raspberry coulis drizzle", price: 70),
        Addon(name: "Lemon curd swirl", price: 170),
        Addon(name: "Candied ginger pieces", price: 70),

      ]),
      Food(name: "Indulgent Salted Caramel Cheesecake", 
      description: "Creamy, caramel, salted perfection.", 
      imagePath: "lib/images/desserts/d4.jpg", 
      price: "890", 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Whiskey-infused whipped cream", price: 70),
        Addon(name: "Sea salt flakes", price: 170),
        Addon(name: "Cookie crumble topping", price: 70),

      ]),



    //drinks
    Food(name: "Ballantine's Bliss", 
      description: "Gold Rush", 
      imagePath: "lib/images/drinks/ballantines.jpg", 
      price: "750", 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Ginger slice", price: 70),
        Addon(name: "Pineapple wedg", price: 170),
        Addon(name: "Strawberry garnish", price: 70),

      ]),
      Food(name: "Coca-Cola Fusion", 
      description: "Classic Elixir", 
      imagePath: "lib/images/drinks/coca cola.jpg", 
      price: "150/=", 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Cucumber slice", price: 70),
        Addon(name: "Mint sprig", price: 170),
        Addon(name: "Lemon wheel", price: 70),

      ]),
      Food(name: "Jameson Jolt", 
      description: " Irish Velvet", 
      imagePath: "lib/images/drinks/jameson.jpg", 
      price: "600", 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Blueberry skewer", price: 70),
        Addon(name: "Coconut rim", price: 170),
        Addon(name: "Edible flower petal", price: 70),

      ]),
      Food(name: "Red Label Revival", 
      description: " Whiskey Tango", 
      imagePath: "lib/images/drinks/red label.jpg", 
      price: "800", 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Pineapple wedge", price: 70),
        Addon(name: "Pickled jalapenos", price: 170),
        Addon(name: "Fried green tomatoes", price: 70),

      ]),
        Food(name: "Pepsi Sparkler", 
      description: "Frosty Fizz", 
      imagePath: "lib/images/drinks/pepsi.jpg", 
      price: "200", 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Pomegranate seed", price: 70),
        Addon(name: "Blackberry garnish", price: 170),
        Addon(name: "Basil leaf garnish", price: 70),

      ]),

  ];
/*
G E T T E R S

*/
List<Food> get menu => _menu;
List<CartItem> get cart => _cart;
String get deliveryAddress => _deliveryAddress;

/*
O P E R A T I O N S

*/
//users cart
final List<CartItem> _cart = [];

//delivery address

String _deliveryAddress = '';


//add to cart
void addToCart(Food, food, List<Addon> selectedAddons) {
  //see if there is a cart item already with the same food and selected addons
  CartItem? cartItem = _cart.firstWhereOrNull((item){
    //check if the food items are the same
    bool isSameFood = item.food == food;

    //check if the list of selected addons are the same
    bool isSameAddons = 
    ListEquality().equals(item.selectedAddons, selectedAddons);

    return isSameFood && isSameAddons;
  } );
  // if item already exists, increase its quantity

  if (cartItem != null) {
    cartItem.quantity++;
  }


//otherwise, add a new cart item to the cart
else{
  _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
}
notifyListeners();

}


//remove from cart
void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);
  if (_cart[cartIndex].quantity > 1) {
    _cart.removeAt(cartIndex);
  }
  notifyListeners();
}
 //update delivery address
 void updateDeliveryAddress(String newAddress) {
  _deliveryAddress = newAddress;
  notifyListeners();
 }



//get total price of cart
double getTotalPrice(){
  double total = 0.0;

  for (CartItem cartItem in _cart) {
    // ignore: unused_local_variable
     double itemTotal = double.parse(cartItem.food.price)   ;

    for (Addon addon in cartItem.selectedAddons) {
      itemTotal += addon.price;
    }
    total += itemTotal * cartItem.quantity;
  }
  return total;
}



//get total number of items from the cart
int getTotalItemCount(){
  int TotalItemCount = 0;

  for (CartItem cartItem in _cart){
    TotalItemCount+= cartItem.quantity;
  }
   return TotalItemCount;
}


//clear cart
void clearCArt(){
  _cart.clear();
  notifyListeners();
}
/*
H E L P E R S


*/

String displayCartReceipt(){
  final receipt = StringBuffer();
  receipt.writeln("Heres your receipt");
  receipt.writeln();

  //format the date to include upto seconds only

  String formattedDate = 
  DateFormat('HH:mm:ss yyy-mm-dd').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("-----------");


  for (final CartItem in _cart){
    receipt.writeln(
      '${CartItem.quantity} x ${CartItem.food.name} - '
    );

    if (CartItem.selectedAddons.isNotEmpty){
      receipt.writeln("   Add-ons: ${_formatAddons(CartItem.selectedAddons)}");
    }
    receipt.writeln();
  }

  // ${_formatPrice(CartItem.food.price as double)}

  receipt.writeln("---------");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total price: ${_formatPrice(getTotalPrice())}");
  receipt.writeln();
  receipt.writeln("Delivering to: $deliveryAddress" );

  return receipt.toString();
}
//format double value into money
String _formatPrice(double price) {
  return "\$${price.toStringAsFixed(2)}";
}


//format list of addons into a string summary
String _formatAddons(List<Addon> addons){
  return addons.map((addon) => "${addon.name} ($_formatPrice(addon.price))").join(", ");
}


}