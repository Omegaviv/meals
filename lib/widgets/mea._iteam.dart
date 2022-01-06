import 'package:flutter/material.dart';
import 'package:meal/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealIteam extends StatelessWidget {
  final Meal meal;

  const MealIteam(this.meal);

  String get complexity{
    switch(meal.complexity){
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';


    }
  }

  String get affordability{
    switch(meal.affordability){
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Luxurious';


    }
  }
  
  void onMealSelected(BuildContext context){
    Navigator.of(context).pushNamed(MealDetail.route, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onMealSelected(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 20,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: 250,
                      color: Colors.black54,
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.fade,
                          fontSize: 20,
                        ),
                        softWrap: true,
                      ),
                    ))
              ],
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6,),
                    Text("${meal.duration} min"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(width: 6,),
                    Text(complexity),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6,),
                    Text(affordability),
                  ],
                )
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
