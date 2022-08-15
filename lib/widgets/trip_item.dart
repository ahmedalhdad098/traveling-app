// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/trips_details_screen.dart';
class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;


  const TripItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
    }) : super(key: key);

void selectScreen(BuildContext ctx){
 Navigator.of(ctx).pushNamed(
      TripsDetailsScreen.screenRouate,
      arguments: id,
      
      );
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectScreen(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 7,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              
              children: [
               _bulidTripImage(),
               _bulidTripText(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 _bulidTripRowDitalies(Icons.today,'$duration يوم'),
                 _bulidTripRowDitalies(Icons.wb_sunny,sesonText()),
                 _bulidTripRowDitalies(Icons.family_restroom,tripTypeText()),
                  ],
                 ),
            )
          ],
        ),
      ),
    );
  }
  _bulidTripImage(){
    return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
            );
  }
  _bulidTripText(){
    return Container(
      decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                 Colors.black.withOpacity(0),
                 Colors.black.withOpacity(0.4),
                ],
                stops: [
                  0.60,
                  1.0,
              ]  , 
      ),
      ),
      height: 250,
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                    ),
                ),
      ),
    );
  }
  _bulidTripRowDitalies(IconData icon,String text) {
    return Row(
      children: [
        Icon(icon,color: Colors.amber,),
        SizedBox(width: 5,),
        Text(text,
        style: TextStyle(
          fontSize: 14
        ),
        ),
      ],
    );
  }
  sesonText(){
    switch(season){
      case Season.Winter:
      return 'شتاء';

      case Season.Spring:
      return 'ربيع';

      case Season.Summer:
      return 'صيف';

      case Season.Autumn:
      return 'خريف';
      
    }
  }
  tripTypeText(){
     switch(tripType){
      case TripType.Exploration:
      return 'استكشاف';

      case TripType.Activities:
      return 'أنشطة';

      case TripType.Recovery:
      return 'رفاهة';

      case TripType.Therapy:
      return 'معالجة';
      
    }
  }
}

