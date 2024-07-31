import 'package:flutter/material.dart';
import 'package:travel/models/trip.dart';
import 'package:travel/screens/categoriscreen.dart';
import 'package:travel/screens/favorit.dart';
import 'package:travel/widgets/drawerd.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen( {super.key, required this.favoriteTrip});
  final List<Trip> favoriteTrip;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selcetScreen(int index){
    setState(() {
      
      _selcted  = index;
    });
  }
  int _selcted =0;
  late List<Map <String, dynamic>> _screens;
  

  @override
  void initState() {
    _screens=[  {
      'Secreen': categorScreen(),
      'Title':'تصنيفات الرحلات',
    },
    {
    'Secreen':  favoitScreen(favoriteTrip: widget.favoriteTrip),
    'Title': 'الرحلات المفضله',
     },
    ];
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(_screens[_selcted]['Title'],
          style: TextStyle(
            color: Colors.white,
            fontSize: 28
          ),
          
          
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      
     endDrawer:  Drawerr(),
      body: _screens[_selcted]['Secreen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selcetScreen ,
        backgroundColor: Colors.blue ,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: _selcted,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.dashboard,
          ),
          label: 'التصنيفات',
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.star,
        ),
          label: 'المفضله',
          ),
          ],
      ),
    );
  }
}