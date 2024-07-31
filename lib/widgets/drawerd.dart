import 'package:flutter/material.dart';
import 'package:travel/screens/filterd.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});
  Widget newMethod( String title , IconData icon ,  onTaplink ) {
    return ListTile(
  leading:Icon(
 icon,
 size: 30,
 color: Colors.blue,
  ) ,
  title: Text(
   title ,
  style: TextStyle(
    fontFamily: 'ElMessiri',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),),
  onTap:onTaplink, 
 );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
   child: Column(
    children: [
      Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.only(top: 40),
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text('دليلك السياحي',
        style: Theme.of(context).textTheme.headline6,)
        
      ),   
      SizedBox(
   height: 20,),

   newMethod( 'الرحلات ', Icons.card_travel , (){
    Navigator.of(context).pushReplacementNamed('/'); 
   }),
    newMethod( ' الفلتره', Icons.filter_list  , (){
    Navigator.of(context).pushReplacementNamed(Filtter.screenRoute); 
   }), 
   
      
    ],
   )

    );
  }

  
}