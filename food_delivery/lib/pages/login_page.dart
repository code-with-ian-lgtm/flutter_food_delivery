import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;


   const LoginPage({
    super.key,
    required this.onTap
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //login method
  void login(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
       Theme.of(context).colorScheme.background,
       
       body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
            const SizedBox(height: 10,),

            //message, app sign in
         Text(
          "Food Delivery App",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
         ),
         const SizedBox(height: 10,),
         //email textfield
         MyTextfield(
          controller: emailController, 
          hintText: "Email", 
          obscureText: false),

          const SizedBox(height: 10,),
          //password textfield
          MyTextfield(
            controller: passwordController, 
            hintText: "Email", 
            obscureText: true),

            const SizedBox(height: 10,),
                  
          //sign in button
          MyButton(
            onTap: login, 
            text: "Sign in"),


          const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not a member?",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              ),
            GestureDetector(
              onTap: widget.onTap,
              child: Text(
                "Register now",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold
                ),
                ),
            ),

          ],
        )
         
         
            // not a member? register now
          ],
         ),
       ),
    );
  }
}