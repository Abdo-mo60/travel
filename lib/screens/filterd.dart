import 'package:flutter/material.dart';
import 'package:travel/widgets/drawerd.dart';

class Filtter extends StatefulWidget {
  const Filtter(void Function(Map<String, bool> filterData) changeFilters, {super.key, required this.saveFilters});
  static const screenRoute = '/filters';
  final Function saveFilters;
  

  @override
  State<Filtter> createState() => _FiltterState();
}

class _FiltterState extends State<Filtter> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false; 


    Widget newMethod( String title , String suptitle,
    var currentValue ,  updat
     ) {
    return SwitchListTile(
      activeColor: Colors.blue,
          title: Text (title,
          style: TextStyle(
            fontSize: 25,
          ),
          ),
          subtitle: Text(suptitle,
          style: TextStyle(
            fontSize: 15,
          ),
          ),
          value: currentValue,
           onChanged:updat,
          );
  } 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.blue,
      title:Center(
        child: Text ('الفلتره',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(
        icon: Icon(Icons.save),
        onPressed: (){
          final selcetedFilter = {
                
    'summer': _Summer,
    'winter': _Winter,
    'family': _Family ,
  
          };
          widget.saveFilters(selcetedFilter); 
        },
        
         )
      ],
     ),
    drawer: Drawerr(),
    body: Column(
       children: [
        SizedBox(height: 80,),
        Expanded(child: ListView(
         children: [
          newMethod(
              'الرحلات الصيفيه ',
          ' اظهار الرحلات الصيفيه فقط ', 
          _Summer,
            (newValue){

            setState(() {
              _Summer = newValue;
            });
            },
          )  ,
          SizedBox(
            height: 80,
          ),
          Divider(),
          SizedBox( 
            height: 80,
          ),
          newMethod(
              ' الرحلات الشتويه ',
          ' اظهار الرحلات الشتويه فقط ', 
          _Winter,
            (newValue){

            setState(() {
              _Winter = newValue;
            });
            },
          )  ,
          SizedBox(
            height: 80,
            
          ),
          Divider(),
          SizedBox(
            height: 80,
          ),
          newMethod(
              ' العائلات',
              ' اظهار الرحلات العائلات فقط', 
          _Family,
            (newValue){

            setState(() {
              _Family  = newValue;
            });
            },
          )  ,
         ],
        ),
        ),
       ],
    ),
    );
  }

 
}

        

         