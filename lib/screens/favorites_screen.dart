import 'package:flutter/material.dart';

import 'package:recepie_app/models/meals.dart';

import '../ui_modals/meal_block.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    Key? key,
    required this.favoriteMeals,
    // required this.favCheck,
  }) : super(key: key);
  final List<Meal> favoriteMeals;

  Widget buildFavoriteScreen(List mealsList) {
    if (mealsList.isNotEmpty) {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealBlock(
              removeItem: () {
                // ignore: avoid_print
                print('gg+');
              },
              id: favoriteMeals[index].id,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration);
        },
      );
    }
    return const Center(
        child: Text(
      "Its lonely here. Please Add some Favorite",
      style: TextStyle(color: Colors.white, fontSize: 20),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: buildFavoriteScreen(favoriteMeals));
  }
}
