// ignore_for_file: constant_pattern_never_matches_value_type, dead_code

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel/screens/trip_Screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  const TripItem({super.key, required this.title, required this.imageUrl, required this.duration, required this.tripType, required this.season, required this.id, 
   //required this.removeItem
  });
  final String title;
  final String imageUrl;
  final int duration;
  final TripTypee tripType;
  final Season season;
  final String id;
 //  final Function removeItem;
  String get seasonText {
    switch(season){  
      case Season.Winter:
      return 'شتاء';
      break;
      case Season.Spring:
       return 'ربيع';
       break;
      case Season.Summer:
       return 'صيف';
       
       break;
      case Season.Autumn:
       return 'خريف';
       break;
       default:
       return 'غير موجود';
    }
   }
   

 String get trioTypeText {
    switch(tripType){
      case TripTypee.Exploration:
        return 'استكشاف';
        break;
      case TripTypee.Recovery:
          return 'نقاهه';
          break;
      case TripTypee.Activites:
          return 'انشطه';
          break;
      case TripTypee.Therapy :
          return 'معالجه';
         break;
      default:
       return 'غير موجود';
    }
   }
void selcetTrip(BuildContext context){
  Navigator.of(context).pushNamed(TripsDataScreen.screenRout,
  arguments : id).then((result){
    if (result != null) {
    //  removeItem(result);
    }
  } );
}  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selcetTrip(context) ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),

        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 250,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                 vertical: 10,
                 horizontal: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter, colors: [

                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                   ],
                   stops: [
                    0.6,1,
                   ]
                
                ),
              ),
              child: Text(title,
              style: Theme.of(context).textTheme.headline6,
              overflow: TextOverflow.fade,
              ),
            )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [

                  Row(
                       children: [
                        Icon(Icons.today ,color: Colors.orange),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration ايام')
                       ],

                  ),
                   Row(
                       children: [
                        Icon(Icons.wb_sunny ,color: Colors.orange),
                        SizedBox(
                          width: 6,
                        ),
                        Text(seasonText),
                       ],

                  ),
                  Row(
                       children: [
                        Icon(Icons.family_restroom ,color: Colors.orange),
                        SizedBox(
                          width: 6,
                        ),
                        Text(trioTypeText),
                       ],

                  ),
                ],
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}