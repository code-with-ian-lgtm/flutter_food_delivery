import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/Services/auth_services.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;


   const LoginPage({
    super.key,
    required this.onTap
    });
    //login method

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

    void login() async{
    //auth service
    final authService = AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(
        _emailController.text, _pwController.text,);
    }

    //catch any errors

    catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
        
      ));
    } }

  

 

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
          controller: _emailController, 
          hintText: "Email", 
          obscureText: false),

          const SizedBox(height: 10,),
          //password textfield
          MyTextfield(
            controller: _pwController, 
            hintText: "Password", 
            obscureText: true),

            const SizedBox(height: 10,),
                  
          //sign in button
          MyButton(
            onTap: (){
              login();
            }, 
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