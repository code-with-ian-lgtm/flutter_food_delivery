import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/pages/delivery.dart';
import 'package:slide_to_act/slide_to_act.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user wants to pay
  void userTappedPay(){
    if (formKey.currentState!.validate()){
      //only show dialog if form is valid
      showDialog(
        context: context,
       builder: ((context) => 
       AlertDialog(
        title: const Text("Confirm Payment"),
       content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text("Card Number: $cardNumber"),
            Text("Expiry date: $expiryDate"),
            Text("Card Holder Name: $cardHolderName"),
            Text("CVV: $cvvCode"),

          ],
        ),
       ),
       actions: [
        //cancel button
        TextButton(onPressed: () => Navigator.pop(context),
         child: const Text("Cancel")),


        //pay button
        TextButton(onPressed: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryProgressPage()));
        }, child: const Text("Pay"))
       ],
       )));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          //credit card 
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (p0){}),


            //creditcard form

          CreditCardForm( 
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName,
            cvvCode: cvvCode, 
            onCreditCardModelChange: ((data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            }), 
            formKey: formKey),

            const Spacer(),

            //slide to pay button 
            Center(
              child: SlideAction(
                outerColor: Theme.of(context).colorScheme.primary,
                text: "Slide to pay",
                sliderButtonIcon: const Icon(
                  Icons.payment_sharp,
                  color: Colors.white,
                  ),
                  sliderRotate: false,
                
                onSubmit: (){
                  if (formKey.currentState!.validate()){
      //only show dialog if form is valid
      showDialog(
        context: context,
       builder: ((context) => 
       AlertDialog(
        title: const Text("Confirm Payment"),
       content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text("Card Number: $cardNumber"),
            Text("Expiry date: $expiryDate"),
            Text("Card Holder Name: $cardHolderName"),
            Text("CVV: $cvvCode"),

          ],
        ),
       ),
       actions: [
        //cancel button
        TextButton(onPressed: () => Navigator.pop(context),
         child: const Text("Cancel")),


        //pay button
        TextButton(onPressed: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryProgressPage()));
        }, child: const Text("Pay"))
       ],
       )));
    }
                  return null;
                },
              ),
            )

           
          
          

        ],
      ),
    );
  }
}