




import 'package:flutter/material.dart';
import 'package:travel/app_data.dart';
import 'package:travel/models/trip.dart';
import 'package:travel/screens/categoriscreen.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel/screens/categoye_tribs.dart';
import 'package:travel/screens/filterd.dart';
import 'package:travel/screens/tabs.dart';
import 'package:travel/screens/trip_Screen.dart';
import './screens/trip_Screen.dart'; 

 void main() {

  runApp( 
       HomePage());
}
class HomePage extends StatefulWidget {
 

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String , bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _avilableTrips = Trips_data;
  List<Trip> _favoriteTrip  =[];

  void _changeFilters( Map<String , bool> filterData){
    setState(() {
      _filters = filterData;
      _avilableTrips=Trips_data.where((trip) {
       if (_filters['summer'] == true && trip.isINSummer !=true) {
          return false;
        }
         if (_filters['winter'] == true && trip.isInWinter !=true) {
          return false;
        }
         if (_filters['family'] == true && trip.isForFamilies !=true) {
          return false;
         }
         return true;
        }).toList();
    });
     
      void _manageFavorite (String tripId){
        final exit = _favoriteTrip.indexWhere(
          (trip) => trip.id==tripId);
          if (exit>=0) {
          setState(() {
            _favoriteTrip.removeAt(exit);
          });
        } else {
            setState(() {
              _favoriteTrip.add(Trips_data.firstWhere(
                (trip ) => trip.id == tripId));
            });
          }
             
      }
    
  }
  bool _isFovarite ( String id){
    return _favoriteTrip.any(
      (trip) => trip.id ==id  );
  }
  @override
  Widget build(BuildContext context) {
   
   
    return MaterialApp(
    
     debugShowCheckedModeBanner: false, 
      title: 'travel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline5: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            
            fontFamily:'ElMessiri' ,
          ),
           headline6: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'ElMessiri',
          ),
        ),
        
        
      ),
      
     // home: categorScreen(),
      routes: {
        '/':(ctx)=> TabsScreen(favoriteTrip: _favoriteTrip),
        categoryTrips.screenRout:(ctx)=> categoryTrips(_avilableTrips),
        TripsDataScreen.screenRout:(ctx)=>TripsDataScreen
       (    isFovarite: _isFovarite,  manageFavorite: _isFovarite,),
        Filtter.screenRoute: (ctx) => Filtter( _changeFilters,
          saveFilters: _changeFilters, 
          ),
      },

    );
  }
}