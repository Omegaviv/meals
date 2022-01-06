import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/mea._iteam.dart';

import '../data/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  List<Meal> _meals;


  CategoryMealScreen(this._meals);

  static  String route = '/category-meal';

  @override
  Widget build(BuildContext context) {
  final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
  final title = routeArgs['title'] as String;
  final id = routeArgs['id']  as String;

  final categoryMeals = _meals.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
          itemBuilder: (context, index){
          return MealIteam(categoryMeals[index]);
          }),
    );
  }
}
