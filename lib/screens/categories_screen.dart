import 'package:flutter/material.dart';
import 'package:recepie_app/data/dummy_data.dart';
import 'package:recepie_app/ui_modals/category_block.dart';

import '../models/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.availableMeals, super.key});
  static const routeName = '/category-screen';
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5 / 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: dummyCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryBlock(
                availableMeals: availableMeals,
                id: dummyCategories[index].id,
                title: dummyCategories[index].title,
                color: dummyCategories[index].color);
          },
        ),
      ),
    );
  }
}
