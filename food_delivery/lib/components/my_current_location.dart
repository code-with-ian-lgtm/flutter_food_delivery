import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(context: context, builder: (context) => 
    AlertDialog(
      title: Text("Your Location"),
      content: TextField(decoration: const InputDecoration(hintText: "Search address..."),
      ),
      actions: [
        //cancel button
        MaterialButton(onPressed: () => Navigator.pop(context),
        child: const Text("Cancel"),
        ),
         MaterialButton(onPressed: () {
          //update delivery address
          var textController;
          String newAddress = textController.text;
          context.read<Restaurant>().updateDeliveryAddress(newAddress);
         },
        child: const Text("Save"),
        )
      ],
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold
          ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(builder: (context, Restaurant, child)=> Text(Restaurant.deliveryAddress)),
                //drop down menu
                Icon(Icons.keyboard_arrow_down_rounded)
                  
              ],
            ),
          )
        ],
      ),
    );
  }
}