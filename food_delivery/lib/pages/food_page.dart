import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {

  final Food food;
  final Map<Addon, bool> selectedAddons = {};
   FoodPage({
    super.key,
    required this.food,
    }){
      //initialize selected addons to be false
      for (Addon addon in food.availableAddons) {
        selectedAddons[addon] = false;
      }
    }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page
    Navigator.pop(context);


    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(Food, food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
        children: [
          //food image
          Image.asset(
            widget.food.imagePath,
            ),
        
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
                    //food name and names
          Text(
            widget.food.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ),
          const SizedBox(height: 10,),

          // food price
          Text(
            widget.food.price.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary
            ),

          ),

          const SizedBox(height: 10),

        
        
          //food description
          Text(widget.food.description,
          style: TextStyle(),),
          const SizedBox(height: 10,),
          Divider(color: Theme.of(context).colorScheme.primary,),
        
        
          Text("Addons"),
          //addons
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                
              )
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.food.availableAddons.length,
              itemBuilder: (context, index) {
                //get individual addon
                Addon addon = widget.food.availableAddons[index];
            
                //return checkbox tile ui
                return CheckboxListTile(
                  title: Text(addon.name),
                  subtitle: Text('Ksh ' + addon.price.toString()),
                  value: widget.selectedAddons[addon], 
                  onChanged: ((bool? value) {
                    setState(() {
                      widget.selectedAddons[addon] = value!;
                    });
                    
                  }));
            
              }
              ),
          )
        
          ],),
          const SizedBox(height: 30,),
        
        
        
        
          //button-> add to cart
          // MyButton(onTap: () => addToCart(widget.food.selectedAddons), text: "Add to Cart"),
          MyButton(onTap: () => addToCart(widget.food, widget.selectedAddons), text: "Add to Cart"),
          const SizedBox(height: 5,)
        ],
            ),
      ),
    ),
    SafeArea(
      child: Opacity(
        opacity: .6,
        child: Container(
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
            
          ),
          child: IconButton(onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
      ),
    )
    
    ],);
  }
}