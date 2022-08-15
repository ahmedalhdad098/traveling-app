

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:matcher/matcher.dart';
import 'package:traveling_app/screens/catogries_screen.dart';
import 'package:traveling_app/screens/favorite_screen.dart';

class TapBarScreens extends StatelessWidget {
  const TapBarScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
       child: Scaffold(
        appBar: AppBar(

          title: Center(child: Text('دليل سياحي')),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard,size: 20,),
                text: 'التصنيفات',
              ),
               Tab(
                icon: Icon(Icons.star,size: 20,),
                text: 'المفضلة',
              ),

            ]),
          ),
        body: TabBarView(
          children: [
              // CategoriesScreen(),
              // FavoriteScreen()
        ]),
        ),
        );
  }
}