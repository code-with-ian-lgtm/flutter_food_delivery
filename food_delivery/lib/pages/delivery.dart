import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/Services/databases/firestore.dart';
import 'package:food_delivery/components/my_receipt.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //get access to firebase
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //submit order to riestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.savedOrderToDatabase(receipt);
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery"),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
      
    );
  }

  //custom Bottom Nav Bar - message / call delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        )
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: (){},
             icon: Icon(Icons.person)),
          ),
          const SizedBox(width: 15,),


          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ian Nicholas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              ),
              Text("Driver",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              )
            ],
          ),
          const Spacer(),


         
          Row(
            children: [
              //message button
              Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: (){},
             icon: Icon(Icons.message),
             color: Theme.of(context).colorScheme.primary,
             ),
          ),              
             const SizedBox(width: 10,),

              //call button
              Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: (){},
             icon: Icon(Icons.call),
             color: Colors.green,
             ),
          ),
            ],
          )


         

        ],
      ),
    );
  }
}