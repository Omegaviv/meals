import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetail extends StatefulWidget {
  static const String route = '/MealDetailScreen';

  final Function addToFav, isFav;

  MealDetail(this.addToFav, this.isFav);

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  Widget titleWidget(String title, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildList(BuildContext context, List<String> ingredients) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 20),
      height: 200,
      width: MediaQuery.of(context).size.width - 100,
      child: ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1})  ${ingredients[index]}',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Divider()
                ],
              ),
            );
          }),
    );
  }

  Widget starIcon(Meal meal) {
    if (widget.isFav(meal.id)) {
      return Icon(Icons.star_border);
    } else
      return Icon(Icons.star);
  }

  @override
  Widget build(BuildContext context) {
    var meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            titleWidget('Ingridents', context),
            buildList(context, meal.ingredients),
            titleWidget('Steps', context),
            buildList(context, meal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.addToFav(meal),
        child: starIcon(meal),
      ),
    );
  }
}
