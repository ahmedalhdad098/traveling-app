// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/catogries_screen.dart';
import 'package:traveling_app/screens/favorite_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class TabsBottomScreen extends StatefulWidget {
  static const screenRouate = 'tapsBottom';
  final List<Trip> favoritTrip;
  TabsBottomScreen(this.favoritTrip);
  @override
  State<TabsBottomScreen> createState() => _TabsBottomScreenState();
}

class _TabsBottomScreenState extends State<TabsBottomScreen> {
  List<Map<String?, Object?>> _screens = [];
  int selectedScreenIndex = 0;
  @override
  void initState() {
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'Title': 'التصنيفات',
      },
      {
        'Screen': FavoriteScreen(widget.favoritTrip),
        'Title': 'الرحلات المفضلة',
      }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(_screens[selectedScreenIndex]['Title'].toString())),
      ),
      drawer: AppDrawer(),
      body: bulidBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: selectedScreenIndex,
        onTap: _selecteScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              size: 20,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 20,
            ),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }

  bulidBody() => _screens[selectedScreenIndex]['Screen'];
  void _selecteScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }
}
