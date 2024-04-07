import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/models/food.dart';

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
                    //food name
          Text(
            widget.food.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ),
          const SizedBox(height: 10,),
        
        
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
          MyButton(onTap: () {}, text: "Add to Cart"),
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