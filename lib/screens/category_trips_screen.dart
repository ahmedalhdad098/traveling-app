import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRout = 'category/trips';

  final List<Trip> avalibleTrips;
  CategoryTripsScreen(this.avalibleTrips);

  @override
  Widget build(BuildContext context) {
    final routeArgment =
     ModalRoute.of(context)?.settings.arguments as Map<String?, String?>;

    final categoryID = routeArgment['id'];
    final categoryTitle = routeArgment['title'];
    final filtterTrips = avalibleTrips.where(
      (trip) {
        return trip.categories.contains(categoryID);
      },
    ).toList();
    
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('$categoryTitle')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{},
          // icon 
        ),

        body: ListView.builder(
          itemCount: filtterTrips.length,
          itemBuilder: (context, index) {
            return TripItem (
                id: filtterTrips[index].id,
                title: filtterTrips[index].title,
                imageUrl: filtterTrips[index].imageUrl,
                duration: filtterTrips[index].duration,
                season: filtterTrips[index].season,
                tripType: filtterTrips[index].tripType);
          },
        )
          
        
        );
      
  }
}
