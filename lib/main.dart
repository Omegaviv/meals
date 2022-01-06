import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';


import './screens/filters_screen.dart';
import './screens/tab_bar_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filter = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetraian':false,

  };
  List<Meal> filtredMeals = DUMMY_MEALS;
  void _selectFilter(Map<String, bool> newFilter){
    setState(() {
      _filter = newFilter;

      filtredMeals = DUMMY_MEALS.where((meal){
        if(_filter['gluten']==meal.isGlutenFree &&
            _filter['lactose']==meal.isLactoseFree &&
            _filter['vegan']==meal.isVegan &&
            _filter['vegetraian']==meal.isVegetarian
        ) return true;
        return false;
      }).toList();
    });
  }

  List<Meal> favoritesMeals =[];

  void addToFavorites(Meal meal){
    setState(() {
      final mealIndes = favoritesMeals.indexWhere((element) => element.id==meal.id);
      if(mealIndes!=-1){
        favoritesMeals.removeAt(mealIndes);
      }
      else favoritesMeals.add(meal);

    });
  }

  bool isInFavorites(String mealId){
    return favoritesMeals.any((meal) => meal.id==mealId);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            subtitle1: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)),

      ),
      home: TaPBarScreen(favoritesMeals),
      routes: {
        './': (ctx) => TaPBarScreen(favoritesMeals),
        CategoryMealScreen.route :(ctx) => CategoryMealScreen(filtredMeals),
        MealDetail.route: (ctx) => MealDetail(addToFavorites,isInFavorites),
        FiltersScreen.route: (ctx) =>FiltersScreen(_selectFilter,_filter),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=> TaPBarScreen(favoritesMeals));
      },
    );
  }
}
