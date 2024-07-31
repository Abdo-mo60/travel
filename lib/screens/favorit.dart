import 'package:flutter/material.dart';
import 'package:travel/models/trip.dart';
import 'package:travel/widgets/trip_item.dart';

class favoitScreen extends StatelessWidget {
  const favoitScreen({super.key, required this.favoriteTrip}) ;
    // TODO: implement favoitScreen
    
  
  final List<Trip> favoriteTrip;
  @override
  Widget build(BuildContext context) {
    if (favoriteTrip.isEmpty) {

       return  Center(
      child: Text(' ليس هناك رحلات مفضله'),);
    }
   else {
    return ListView.builder(
    itemBuilder: (ctx ,index){
      return TripItem(
        id :favoriteTrip[index].id,
        title: favoriteTrip[index].title, 
      imageUrl: favoriteTrip[index].imagUrl, 
      duration: favoriteTrip [index].duration,
       tripType: favoriteTrip[index].tripType,
       season: favoriteTrip[index].season,   
      // removeItem: _removeTrip, 
       );
    },
    itemCount:favoriteTrip.length ,
      );
   }
    
  }
}