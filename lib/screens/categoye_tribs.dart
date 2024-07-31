import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';
import 'package:travel/widgets/trip_item.dart';
import '../app_data.dart';

class categoryTrips extends StatefulWidget {
  static const screenRout = '/catogery-trips';
  final List<Trip> avilableTrips;

  categoryTrips( this.avilableTrips);

  @override
  State<categoryTrips> createState() => _categoryTripsState();
}

class _categoryTripsState extends State<categoryTrips> {
    late String? categoryTitle;
   late List<Trip> displayTrip;

  
bool _didChangeDependenciesCalled = false;
   
 
  @override
  void didChangeDependencies() {
    
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_didChangeDependenciesCalled) {
        final routArgument = ModalRoute.of(context)?.settings.
    arguments as Map<String,String>;
    final categoryeID = routArgument['id'];
     categoryTitle = routArgument['title']!;
    displayTrip =Trips_data.where((trip) {

       return trip.catogeris.contains(categoryeID);
    }).
    toList();
  _didChangeDependenciesCalled=true;
      
    }
  }
    void _removeTrip (String tripId) {
      setState(() {
         displayTrip.removeWhere((trip) => trip.id == tripId); 
      });

    }
 // const categoryTrips(String id, String title, {super.key, required this.categoryeID, required this.categoyrTitle});
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title:  
          
           Center(
             child: Padding(
               padding: const EdgeInsets.only(right: 65),
               child: Text(categoryTitle!,
                         style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                
                         ),),
             ),
           ),
        
      ),
      body: ListView.builder(
    itemBuilder: (ctx ,index){
      return TripItem(
        id :displayTrip[index].id,
        title: displayTrip[index].title, 
      imageUrl: displayTrip[index].imagUrl, 
      duration: displayTrip[index].duration,
       tripType: displayTrip[index].tripType,
       season: displayTrip[index].season, 
      // removeItem: _removeTrip,
       );
    },
    itemCount:displayTrip.length ,
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Trip>('displayTrips', displayTrip));
  }
}
