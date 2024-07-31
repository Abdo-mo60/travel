import 'package:flutter/material.dart';
import 'package:travel/app_data.dart';
import 'package:flutter/widgets.dart';
import '../app_data.dart';
import '../widgets/catogry_item.dart';
class categorScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200 ,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 33,
          crossAxisSpacing: 5,
        ),
       
        children: Categories_data.map((categoryData) =>categoryItem(
          title:categoryData.title, imageUrl:categoryData.imageUrl, id: categoryData.id,) ).toList() ,
      
      );
      
    
  
  }
}