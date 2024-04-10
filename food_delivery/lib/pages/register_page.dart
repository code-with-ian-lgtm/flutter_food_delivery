import 'package:flutter/material.dart';
import 'package:food_delivery/Services/auth_services.dart';
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
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _confirmController = TextEditingController();



  //register method
  void register() async{
    //get Auth service

    // ignore: no_leading_underscores_for_local_identifiers
    final _auth = AuthService();

    //password match => create user
    if (_pwController.text == _confirmController.text){
      try{
        _auth.signUpWithEmailPassword(
          _emailController.text, 
          _pwController.text
          );

      } catch (e) {
         // ignore: use_build_context_synchronously
      showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
        
      ));

      }

    }
    //password missmatch show error
    else {
      showDialog(context: context,
      builder: (context) => const AlertDialog(
        title: Text("Password missmatch"),
        
      ));
    }

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
          "Create an Account",
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
          MyTextfield(
            controller: _confirmController, 
            hintText: "Confirm Password", 
            obscureText: true),

            const SizedBox(height: 10,),
                  
          //sign in button
          MyButton(
            onTap: () {
              register();
            },
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
       