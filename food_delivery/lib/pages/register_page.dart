import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

   RegisterPage({
    super.key,
    required this.onTap,
    });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordcontroller = TextEditingController();

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
          "Create an Account",
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
            hintText: "Password", 
            obscureText: true),

            const SizedBox(height: 10,),
          MyTextfield(
            controller: passwordController, 
            hintText: "Confirm Password", 
            obscureText: true),

            const SizedBox(height: 10,),
                  
          //sign in button
          MyButton(
            onTap: () {}, 
            text: "Sign Up"),


          const SizedBox(height: 20,),

          //already have an account loin

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an Account?",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              ),
            GestureDetector(
              onTap: widget.onTap,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold
                ),
                ),
            ),

          ],
        )
         
         
            
          ],
         ),
       ),
       );
       }
       }
       