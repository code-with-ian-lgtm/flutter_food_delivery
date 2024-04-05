import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_current_location.dart';
import 'package:food_delivery/components/my_description_box.dart';
import 'package:food_delivery/components/my_drawer.dart';
import 'package:food_delivery/components/my_sliver_app_bar.dart';
import 'package:food_delivery/components/my_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
     
      drawer: MyDrawer(),
      body: NestedScrollView(headerSliverBuilder:(context, innerBoxIsScrolled)=> [
        MySliverAppBar(
          title: MyTabBar(tabController: _tabController),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
              ),
              //my current location
              const MyCurrentLocation(),


              //description box
              const MyDescriptionBox(),
            ],
          )
         )
      ],
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index)=>
             const Text("first")),
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index)=>
             const Text("second")),
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index)=>
             const Text("third")),
        ]
        
        ),
      ),
    );
  }
}