import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  static const screenRouate='favorite';
   final List<Trip> favoritTrips;
   FavoriteScreen(this.favoritTrips);

  @override
  Widget build(BuildContext context) {
    if(favoritTrips.isEmpty)
      return Center(child: Text("لا يوجد لديك رحلات في المفضلة"),);
    else
    return Scaffold(
      body: ListView.builder(
          itemCount: favoritTrips.length,
          itemBuilder: (context, index) {
            return TripItem (
                id: favoritTrips[index].id,
                title: favoritTrips[index].title,
                imageUrl: favoritTrips[index].imageUrl,
                duration: favoritTrips[index].duration,
                season: favoritTrips[index].season,
                tripType: favoritTrips[index].tripType
                 );
          },
        )
    );
}
}