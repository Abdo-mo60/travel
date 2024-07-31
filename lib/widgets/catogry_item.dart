import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screens/categoye_tribs.dart';

class categoryItem extends StatelessWidget {
  const categoryItem({super.key, required this.title, required this.imageUrl, required this.id});
  final String title;
  final String id;
  final String imageUrl;
  void selectCategory(BuildContext ctx){
   Navigator.of(ctx).pushNamed(
    categoryTrips.screenRout,
    arguments: {
      'id': id,
      'title':title,
      
    }
   );
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(imageUrl,
          height: 250,
          fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(title,
          style: Theme.of(context).textTheme.headline6,
          ),
          
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15)
          ),
        ),
      ],
      
      ),
    ); 
  }
}