import 'package:flutter/material.dart';
import 'package:recepie_app/data/dummy_data.dart';

import '../models/meals.dart';

class FavoriteMeals with ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  void toggelFavorite(String mealId) {
    final meal = dummyMeals.firstWhere((element) => element.id == mealId);
    if (favoriteMeals.contains(meal)) {
      favoriteMeals.remove(meal);
    } else {
      favoriteMeals.add(meal);
    }
    notifyListeners();
  }
}
