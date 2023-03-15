import 'package:flutter/material.dart';

import 'package:recepie_app/data/dummy_data.dart';
import 'package:recepie_app/models/meals.dart';
import 'package:recepie_app/ui_modals/meal_block.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({
    Key? key,
    required this.catId,
    required this.title,
    required this.color,
    required this.availableMeals,
  }) : super(key: key);
  static const routeName = 'meals-screen';
  final String catId;
  final String title;
  final Color color;
  final List<Meal> availableMeals;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  //filtred meals
  late List filtredMeals = widget.availableMeals
      .where((element) => element.categories.contains(widget.catId))
      .toList();

  void removeItem(String mealId) {
    setState(() {
      filtredMeals.removeWhere(
        (element) => element.id == mealId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView.builder(
          itemCount: filtredMeals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealBlock(
                removeItem: removeItem,
                id: filtredMeals[index].id,
                imageUrl: filtredMeals[index].imageUrl,
                title: filtredMeals[index].title,
                affordability: filtredMeals[index].affordability,
                complexity: filtredMeals[index].complexity,
                duration: filtredMeals[index].duration);
          },
        ),
      ),
    );
  }
}
