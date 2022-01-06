import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/mea._iteam.dart';

class Favorites extends StatelessWidget {
 List<Meal> favMeals;


 Favorites(this.favMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favMeals.isEmpty? Text('Favorites yet to be added '):ListView.builder(
        itemCount: favMeals.length,
        itemBuilder: (context, index){
          return MealIteam(favMeals[index]);
        }),

    );
  }
}
