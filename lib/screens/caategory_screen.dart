import 'package:flutter/material.dart';

import '../widgets/category_iteam.dart';
import '../data/dummy_data.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            title: category.title,
            color: category.color,
            id: category.id,
          );
        }).toList(),
      ),
    );
  }
}
