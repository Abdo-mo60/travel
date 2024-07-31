 import 'package:flutter/material.dart';
 enum Season{
  Winter,
  Spring,
  Summer,
  Autumn,

 }
 enum TripTypee{

  
  Exploration,
  Recovery,
  Activites,
  Therapy,
 }

class Trip{
  final String id;
  final List< String> catogeris;
  final String title;
  final String imagUrl;
  final List<String> activites;
  final List<String> program;
  final int duration;
  final Season season ;
  final TripTypee tripType;
  final bool isINSummer;
  final bool isInWinter;
  final bool isForFamilies;
  const Trip({required this.id, required this.catogeris,
   required this.title, required this.imagUrl, required this.activites, 
 required this.program, required this.duration, required this.season, required this.tripType,
   required this.isINSummer, required this.isInWinter, required this.isForFamilies, });
}