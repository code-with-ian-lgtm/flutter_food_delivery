import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_drawer_tile.dart';
import 'package:food_delivery/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list tile
          MyDrawerTile(
            icon: Icons.home, 
            onTap: () => Navigator.pop(context), 
            text: "Home"),


          MyDrawerTile(
            icon: Icons.settings, 
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage()));
            }, 
            text: "Settings"),

          const Spacer(),

          MyDrawerTile(
            icon: Icons.logout, 
            onTap: (){}, 
            text: "Logout"),

          const SizedBox(height: 10,)


          //
        ],
      ),

    );
  }
}