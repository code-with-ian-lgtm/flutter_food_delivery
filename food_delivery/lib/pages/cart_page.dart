import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      //CART
      final userCart = restaurant.cart;

      //scaffold ui
      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: (){
                showDialog(
                  context: context, 
                builder: (context) => AlertDialog(
                  title: Text("You`re About to clear the cart"),
                  actions: [
                    //cancel button
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                    child: const Text("Cancel")),


                    //clear button
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        restaurant.clearCArt();
                      }, 
                    child: const Text("Clear")),

                  ],
                ));
              },
             icon: Icon(Icons.delete)
             ),

          ],
        ),
        body: Column(
          children: [
            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty ? const Expanded(
                    child: Center(child: const Text(
                      "Cart is empty",
                      style: TextStyle(
                        fontSize: 20
                      ),
                      )
                    )
                    ):
                  Expanded(child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      //get individual cart item
                      final cartItem = userCart[index];
                      //return cart tile
                     return MyCartTile(cartItem: cartItem);
                    }
                  ))
                ],
              ),
            ),
            //button to pay
            MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentPage())),
             text: "Pay Now"),
             const SizedBox(height: 10,)
          ],
        ),
      );
    },);
  }
}