import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({required this.title, required this.color, required this.id});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.route,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        )),
      ),
    );
  }
}
