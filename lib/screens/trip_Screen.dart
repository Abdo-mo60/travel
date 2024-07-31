// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:travel/app_data.dart';

class TripsDataScreen extends StatelessWidget {
  const TripsDataScreen(  {super.key, required this.manageFavorite, required this.isFovarite});
   static const screenRout = '/ trip-detail ';
   final Function manageFavorite;
   final Function isFovarite;
   Widget sectionTitle( BuildContext context, String titleText)=> Container(
          margin: EdgeInsets.symmetric(horizontal: 160, vertical: 10),
          alignment: Alignment.topRight,
          child: Text( titleText ,
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue,
          ),
          ),
        ); 
     Widget ListViewcontonier (Widget child) {

     return 
           Center(
             child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
             
              ),
              height: 200,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: child, ),
           );
     }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.
    arguments as String ;
    // ignore: unused_local_variable
    final selecetTrip = Trips_data.firstWhere((trip) => trip.id ==
    tripId);
    return Scaffold(
appBar: AppBar(
   foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
  title: Padding(
    padding: const EdgeInsets.only(right: 65),
    child: Center( 
      child: Text('${selecetTrip.title}'),
      ),
  ),
),
    body: 
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selecetTrip.imagUrl,
            fit: BoxFit.cover,),
      
          ),
          SizedBox(
            height: 10,
          ),
          sectionTitle(context, 'الانشطه'),
          ListViewcontonier(
          
               ListView.builder(
                itemCount: selecetTrip.activites.length,
                itemBuilder: (ctx, index) =>  Card(
                  elevation: 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4
                      ,
                      horizontal: 15,
                      ),
                    child: Text(selecetTrip.activites[index]),
                  ),
                ),
              ),
            ),
      
          
          SizedBox(
            height: 10,
          ),
          Text('البرنامج اليومي',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
          ),),
          ListViewcontonier(
        ListView.builder(
          itemCount: selecetTrip.program.length,
          itemBuilder: (ctx , index ) => Column(
            children: [
              ListTile(
               
                leading:  CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('يوم${index +1}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  
                  ),
                  title: Text(selecetTrip.program[index]),
                 
              ),
              Divider(),
            ],
          )
        ),
          ),
          SizedBox(
            height: 100,
          ), 
         
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.amber,
      child: Icon(
        isFovarite(tripId) ? Icons.star : Icons.star_border
      ),
     
      onPressed: (){
        ()=>  manageFavorite(tripId);
      }
      ),
    );
  }
}   