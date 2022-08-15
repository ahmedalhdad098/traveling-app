
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/taps_bottom_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Column(
        children: [
          Container(
            height: 83,
            color:Colors.amber,
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            child: Center(child: Text('دليلك السياحي',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
            
          ),
        SizedBox(height: 20),
      
        bulidListTitle(
          'التصنيفات',
          Icons.card_travel,
          context,
          TabsBottomScreen.screenRouate
        ),
         bulidListTitle(
          'الفلترة',
          Icons.filter_list,
          context,
          FiltersScreen.screenRouate
        ),
                  ],
      ),
    );
  }

  ListTile bulidListTitle(title,IconData icon,BuildContext ctx,routeScreen) {
    return ListTile(
        leading: Icon(
          icon,
          size: 30,
          color:Colors.blue
          ),
          title: Text(
            title,
            style:TextStyle(
              color:Colors.blue
              ),
          ),
          onTap:()=>  moveScreen(ctx,routeScreen),
      );
  }
  
   moveScreen(BuildContext ctx,routeScreen) {
      Navigator.of(ctx).pushReplacementNamed(routeScreen);  
  }
}