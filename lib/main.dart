import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'package:traveling_app/screens/catogries_screen.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/taps_bottom_screen.dart';
import 'package:traveling_app/screens/trips_details_screen.dart';
import 'screens/tap_bar_top_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _switchfilters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> avalibleTrips = Trips_data;
  List<Trip> _favoritTrips = [];

  _saveFilters(Map<String, bool> filterData) {
    setState(() {
      _switchfilters = filterData;
      avalibleTrips = Trips_data.where((trip) {
        if (_switchfilters['summer'] == true && trip.isInSummer != true)
          return false;

        if (_switchfilters['winter'] == true && trip.isInWinter != true)
          return false;

        if (_switchfilters['family'] == true && trip.isForFamilies != true)
          return false;

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AR'),
        ],
        theme: ThemeData(fontFamily: 'Cairo'),
        initialRoute: TabsBottomScreen.screenRouate,
        // home: CategoriesScreen(),
        routes: {
          TabsBottomScreen.screenRouate: (ctx) => TabsBottomScreen(_favoritTrips),
          CategoryTripsScreen.screenRout: (ctx) =>
              CategoryTripsScreen(avalibleTrips),
          TripsDetailsScreen.screenRouate: (ctx) => TripsDetailsScreen(),
          FiltersScreen.screenRouate: (ctx) =>
              FiltersScreen(_switchfilters, _saveFilters),
        });
  }
}
