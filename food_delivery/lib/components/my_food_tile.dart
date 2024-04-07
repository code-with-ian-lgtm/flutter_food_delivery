import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food, 
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [

              //food texts
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name),
                  Text('Ksh' + food.price.toString(),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 20,),
                  Text(food.description,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              )
              ),
              //food image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  food.imagePath,
                  height: 200,
                  width: 200,
                  ),
              )

            ],
          ),
        ),
         Divider(color: Theme.of(context).colorScheme.primary,)
      ],
    );
  }
}